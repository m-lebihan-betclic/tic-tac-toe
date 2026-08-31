import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';

part 'game_ui_state.br.freezed.dart';

/// Everything the board draws, in one object.
///
/// The board exists once rather than once per status: [banner] is the only thing that varies
/// between the three board states.
///
/// The scores are deliberately not here. They are a projection of the session's finished rounds,
/// which outlive any one board — so they are read from `storedScoresProvider`, by this screen and
/// by the history screen alike, and neither can disagree with the other.
@freezed
abstract class GameUiState with _$GameUiState {
  const factory GameUiState({
    required StatusBanner banner,
    required Game game,
  }) = _GameUiState;

  const GameUiState._();

  /// Taps are ignored while the CPU is thinking and after the game ends. The domain would refuse
  /// them anyway — this is what stops the board *looking* live when it is not.
  bool get isInteractive => game.status is PlayerTurn;
}
