import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;

/// The level the settings screen has stored. A provider rather than a mutable field, because the
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

/// A container with the board *kept alive*, which is what a mounted screen does. Without a
/// listener the state provider disposes the moment each `read` returns, and every assertion would
/// be made against a brand-new game — a test that passes by never testing anything.
ProviderContainer _liveContainer() => _container()..listen(gameUiStateProvider, (_, _) {}, fireImmediately: true);

ProviderContainer _container() => ProviderContainer(
  overrides: <Override>[
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
  ],
);

void main() {
  test('changing the level in settings leaves the round in progress alone', () {
    final ProviderContainer container = _liveContainer();
    addTearDown(container.dispose);

    container.read(gameUiStateProvider.notifier).play(4);
    expect(container.read(gameUiStateProvider).game.board.markAt(4), Mark.x);

    container.read(storedDifficulty.notifier).difficulty = Difficulty.hard;

    // The board is untouched — nobody's game is cleared by a visit to settings.
    expect(container.read(gameUiStateProvider).game.board.markAt(4), Mark.x);
    // And the round is still played at the level it started at, which is the rule the caption
    // under the control states: nobody switches to easy one move from losing.
    expect(container.read(gameUiStateProvider).game.difficulty, Difficulty.easy);
  });

  test('the next round picks the level up', () {
    final ProviderContainer container = _liveContainer();
    addTearDown(container.dispose);

    container.read(gameUiStateProvider.notifier).play(4);
    container.read(storedDifficulty.notifier).difficulty = Difficulty.hard;

    container.read(gameUiStateProvider.notifier).reset();

    expect(container.read(gameUiStateProvider).game.difficulty, Difficulty.hard);
    expect(container.read(gameUiStateProvider).game.board.moveCount, 0);
  });
}
