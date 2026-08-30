import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:shouldly/shouldly.dart';

/// The level the settings screen has stored. A notifier rather than a mutable field, because the
/// real chain notifies: the store is a notifier, so a write rebuilds the repository and every read
/// provider downstream. A fake that stored quietly would prove nothing about that chain.
final NotifierProvider<StoredDifficulty, Difficulty?> storedDifficulty =
    NotifierProvider<StoredDifficulty, Difficulty?>(StoredDifficulty.new);

class StoredDifficulty extends Notifier<Difficulty?> {
  @override
  Difficulty? build() => null;

  Difficulty? get difficulty => state;

  /// What the settings screen's segmented control does, through `saveDifficulty`.
  set difficulty(Difficulty? value) => state = value;
}

final class _Preferences implements PreferencesRepository {
  final Difficulty? _difficulty;

  const _Preferences(this._difficulty);

  @override
  Difficulty? readDifficulty() => _difficulty;

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

final class _NoopRouting implements game_presentation.GameRouting {
  const _NoopRouting();

  @override
  void onHistoryRequested() {}

  @override
  void onSettingsRequested() {}
}

List<Override> _overrides(TestContext _) => <Override>[
  ...design_providers.bindProviders(
    palette: Provider<AppPalette>((ref) => AppPalette.light()),
    typography: Provider<AppTypography>((ref) => AppTypography.system()),
  ),
  ...session_domain.bindProviders(
    preferences: Provider<PreferencesRepository>((ref) => _Preferences(ref.watch(storedDifficulty))),
  ),
  ...game_presentation.bindProviders(
    player: Provider<Player>((ref) => Player.create('Morgan').getOrThrow()),
    routing: (ref) => const _NoopRouting(),
  ),
];

/// The board, *kept alive*, which is what a mounted screen does. Without a listener the state
/// provider disposes the moment each `read` returns, and every assertion would be made against a
/// brand-new game — a test that passes by never testing anything.
ProviderContainer _liveBoard(TestContext context) =>
    context.ref..listen(gameUiStateProvider, (_, _) {}, fireImmediately: true);

void main() {
  given('a round in progress on easy, with a mark on the centre square', (context) {
        final ProviderContainer container = _liveBoard(context);
        container.read(gameUiStateProvider.notifier).play(4);

        return container;
      }, providers: _overrides)
      .when('the player switches to hard in settings', (container, _) {
        container.read(storedDifficulty.notifier).difficulty = Difficulty.hard;

        return container.read(gameUiStateProvider).game;
      })
      .then('the board is untouched and the round is still being played on easy', (game, _) {
        game.board.markAt(4).should.be(Mark.x);
        game.difficulty.should.be(Difficulty.easy);
      });

  given('a round in progress, with hard chosen in settings since it started', (context) {
        final ProviderContainer container = _liveBoard(context);
        container.read(gameUiStateProvider.notifier).play(4);
        container.read(storedDifficulty.notifier).difficulty = Difficulty.hard;

        return container;
      }, providers: _overrides)
      .when('the player clears the board', (container, _) {
        container.read(gameUiStateProvider.notifier).reset();

        return container.read(gameUiStateProvider).game;
      })
      .then(
        'the next round starts empty and on hard',
        (game, _) => game.should.be(Game.initial(difficulty: Difficulty.hard)),
      );
}
