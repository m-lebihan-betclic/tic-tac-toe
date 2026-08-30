import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:session_domain/session_domain.dart';

part 'game_ui_state.br.freezed.dart';

/// Everything the board draws, in one object.
///
/// The board and the scores exist once rather than once per status, because they do not change
/// with it. [banner] is the only thing that varies between the three board states.
@freezed
abstract class GameUiState with _$GameUiState {
  const factory GameUiState({
    required StatusBanner banner,
    required Game game,
    required Scores scores,
  }) = _GameUiState;

  const GameUiState._();

  /// Taps are ignored while the CPU is thinking and after the game ends. The domain would refuse
  /// them anyway — this is what stops the board *looking* live when it is not.
  bool get isInteractive => game.status is PlayerTurn;
}
