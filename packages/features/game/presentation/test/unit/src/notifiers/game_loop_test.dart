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
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';

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
    ...game_presentation.bindProviders(
      player: Provider<Player>((ref) => Player.create('Morgan').getOrNull()!),
      routing: (ref) => const _NoopRouting(),
    ),
  ],
);

Future<void> _pumpScreen(WidgetTester tester, ProviderContainer container) async {
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
  testWidgets('a move hands over to the CPU, which replies after the beat', (tester) async {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);
    await _pumpScreen(tester, container);

    container.read(gameUiStateProvider.notifier).play(4);
    await tester.pump();

    expect(container.read(gameUiStateProvider).game.board.markAt(4), Mark.x);
    expect(container.read(gameUiStateProvider).banner, isA<Thinking>());
    expect(container.read(gameUiStateProvider).game.board.moveCount, 1, reason: 'CPU has not moved yet');

    await tester.pump(AppMotion.cpuThinkingDelay);

    expect(container.read(gameUiStateProvider).game.board.moveCount, 2, reason: 'CPU replied');
    expect(container.read(gameUiStateProvider).banner, isA<Turn>());
  });

  testWidgets('a reset landing mid-beat cancels it — the CPU never lands on the cleared board', (tester) async {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);
    await _pumpScreen(tester, container);

    container.read(gameUiStateProvider.notifier).play(0);
    await tester.pump();
    container.read(gameUiStateProvider.notifier).reset();
    await tester.pump(AppMotion.cpuThinkingDelay * 2);

    expect(container.read(gameUiStateProvider).game.board, Board.empty);
    expect(container.read(gameUiStateProvider).banner, isA<Cleared>());
  });

  testWidgets('tapping a taken slot marks it invalid without changing the board', (tester) async {
    final ProviderContainer container = _container();
    addTearDown(container.dispose);
    await _pumpScreen(tester, container);

    container.read(gameUiStateProvider.notifier).play(4);
    await tester.pump(AppMotion.cpuThinkingDelay);
    final Board before = container.read(gameUiStateProvider).game.board;

    container.read(gameUiStateProvider.notifier).play(4);
    await tester.pump();

    expect(container.read(gameUiStateProvider).game.board, before);
    expect(container.read(gameUiStateProvider).banner, const StatusBanner.invalid(slot: 4));
  });
}
