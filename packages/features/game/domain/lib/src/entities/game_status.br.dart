import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:session_domain/session_domain.dart';

part 'game_status.br.freezed.dart';

/// Whose turn it is, or how the game ended.
///
/// Sealed, so the compiler knows the complete list and a `switch` over it must handle every case
/// and needs no `default`. Add a case later and every switch in the app fails to compile until it
/// is handled — that is the feature, not the inconvenience.
///
/// [Finished.winningLines] is empty exactly when the outcome is a draw, and holds two when a
/// single move completed two lines at once.
@freezed
sealed class GameStatus with _$GameStatus {
  const factory GameStatus.cpuTurn() = CpuTurn;

  const factory GameStatus.finished({
    required GameOutcome outcome,
    @Default(<WinningLine>{}) Set<WinningLine> winningLines,
  }) = Finished;

  const factory GameStatus.playerTurn() = PlayerTurn;
}
