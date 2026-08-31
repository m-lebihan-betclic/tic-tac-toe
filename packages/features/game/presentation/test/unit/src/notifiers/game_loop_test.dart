import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/game_screen.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/state/game_ui_state.br.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:givn/givn.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:shouldly/shouldly.dart';

/// Nothing is stored, which is the state a cold start is in: the notifier falls back to
/// `Difficulty.initial`. The contract still has to be fed — an unfed one throws, by design.
final class _EmptyPreferences implements PreferencesRepository {
  const _EmptyPreferences();

  @override
  Difficulty? readDifficulty() => null;

  @override
  AppLocale? readLocale() => null;

  @override
  AppTheme? readTheme() => null;

  @override
  void writeDifficulty(Difficulty difficulty) {}

  @override
  void writeLocale(AppLocale locale) {}

  @override
  void writeTheme(AppTheme theme) {}
}

/// Rounds, in a list. The board writes finished ones through the contract now, so a test that
/// leaves it unfed gets the loud failure the design intends — which is what this is here to feed.
final class _SessionHistory implements HistoryRepository {
  final List<Round> _rounds = <Round>[];

  @override
  List<Round> read() => _rounds;

  @override
  void write(Round round) => _rounds.insert(0, round);
}

final class _NoopRouting implements game_presentation.GameRouting {
  const _NoopRouting();

  @override
  void onHistoryRequested() {}

  @override
  void onSettingsRequested() {}
}

ProviderContainer _container() => ProviderContainer(
  overrides: <Override>[
    ...design_providers.bindProviders(
      palette: Provider<AppPalette>((ref) => AppPalette.light()),
      typography: Provider<AppTypography>((ref) => AppTypography.system()),
    ),
    // Only the direct dependency, and through the public seam: the board reads the level through
    // `session_domain`, so that is what a test feeds — never a `providers_di` symbol.
    ...session_domain.bindProviders(
      history: Provider<HistoryRepository>((ref) => _SessionHistory()),
      preferences: Provider<PreferencesRepository>((ref) => const _EmptyPreferences()),
    ),
    ...game_presentation.bindProviders(
      player: Provider<Player>((ref) => Player.create('Morgan').getOrThrow()),
      routing: (ref) => const _NoopRouting(),
    ),
  ],
);

Future<void> _pumpBoard(WidgetTester tester, ProviderContainer container) async {
  addTearDown(container.dispose);
  // A phone, not the 800×600 default: the board is square and takes the height it is given.
  tester.view
    ..devicePixelRatio = 1
    ..physicalSize = const Size(390, 780);
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        home: const GameScreen(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[AppPalette.light(), AppTypography.system()],
          useMaterial3: true,
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  givenWidget("an empty board on the player's turn", (_) => _container())
      .when('the player takes the centre square and the CPU is given its beat', (
        container,
        _,
        tester,
        _,
      ) async {
        await _pumpBoard(tester, container);

        container.read(gameUiStateProvider.notifier).play(4);
        await tester.pump();
        final GameUiState duringTheBeat = container.read(gameUiStateProvider);

        await tester.pump(AppMotion.cpuThinkingDelay);

        return (duringTheBeat, container.read(gameUiStateProvider));
      })
      .then('the mark lands, the CPU is seen thinking, and it replies once', (result, _, _) {
        final (GameUiState duringTheBeat, GameUiState afterTheBeat) = result;

        duringTheBeat.game.board.markAt(4).should.be(Mark.x);
        duringTheBeat.banner.should.be(const StatusBanner.thinking());
        duringTheBeat.game.board.moveCount.should.be(1);

        afterTheBeat.game.board.moveCount.should.be(2);
        afterTheBeat.banner.should.be(const StatusBanner.turn());
      });

  givenWidget("a board waiting on the CPU's beat", (_) => _container())
      .when('the player clears it before the beat lands', (container, _, tester, _) async {
        await _pumpBoard(tester, container);

        container.read(gameUiStateProvider.notifier).play(0);
        await tester.pump();
        container.read(gameUiStateProvider.notifier).reset();
        await tester.pump(AppMotion.cpuThinkingDelay * 2);

        return container.read(gameUiStateProvider);
      })
      .then('the board stays empty — the CPU never lands on a board that no longer exists', (
        state,
        _,
        _,
      ) {
        state.game.board.should.be(Board.empty);
        state.banner.should.be(const StatusBanner.cleared());
      });

  givenWidget('a board whose centre square is already taken', (_) => _container())
      .when('the player takes it again', (container, _, tester, _) async {
        await _pumpBoard(tester, container);

        container.read(gameUiStateProvider.notifier).play(4);
        await tester.pump(AppMotion.cpuThinkingDelay);
        final Board before = container.read(gameUiStateProvider).game.board;

        container.read(gameUiStateProvider.notifier).play(4);
        await tester.pump();

        return (before, container.read(gameUiStateProvider));
      })
      .then('the square is marked invalid and the board is unchanged', (result, _, _) {
        final (Board before, GameUiState state) = result;

        state.game.board.should.be(before);
        state.banner.should.be(const StatusBanner.invalid(slot: 4));
      });
}
