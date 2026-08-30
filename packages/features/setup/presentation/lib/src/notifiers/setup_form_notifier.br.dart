import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';
import 'package:setup_presentation/src/providers_di.br.dart';
import 'package:setup_presentation/src/state/setup_form_state.br.dart';

part 'setup_form_notifier.br.g.dart';

/// Holds what the sheet has been told so far, and writes it through the contracts on submit.
///
/// Theme is the exception: it is written as it is chosen, because the sheet previews the choice
/// by repainting itself, and previewing means the app already has to be wearing it.
@riverpod
class SetupFormNotifier extends _$SetupFormNotifier {
  @override
  SetupFormState build() => SetupFormState(
    difficulty: ref.read(storedDifficultyProvider) ?? Difficulty.initial,
    // Prefilled when settings reopens this sheet; empty on a cold start.
    name: ref.read(storedPlayerProvider)?.name ?? '',
    theme: ref.read(storedThemeProvider),
  );

  /// Validated on every keystroke, synchronously. Debouncing buys time back when the work is
  /// expensive, and measuring a twelve-character string is free.
  void nameChanged(String name) => state = state.copyWith(name: name);

  void difficultyChanged(Difficulty difficulty) => state = state.copyWith(difficulty: difficulty);

  void themeChanged(AppTheme theme) {
    // Written immediately rather than on submit: the sheet previews the choice by repainting, and
    // it can only do that if the app is already wearing it.
    ref.read(saveThemeProvider)(theme);
    state = state.copyWith(theme: theme);
  }

  /// Writes the player and the level, then tells composition it is done. Returns without writing
  /// if the name is not a valid one — the button is disabled for exactly that case, and the
  /// domain refuses it besides.
  void submit() {
    final Player? player = Player.create(state.name).getOrNull();
    if (player == null) return;

    ref.read(savePlayerProvider)(player);
    ref.read(saveDifficultyProvider)(state.difficulty);
    ref.read(setupRoutingProvider).onSetupCompleted();
  }
}
