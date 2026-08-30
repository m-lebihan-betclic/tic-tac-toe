import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/entities/game_status.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/move_error.br.dart';
import 'package:session_domain/session_domain.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// The human takes a slot.
///
/// Returns a failure *value* rather than throwing: the three rejections are three cases on one
/// signature the compiler forces the caller to handle.
class PlayMove {
  const PlayMove();

  Result<Game, MoveError> call(Game game, int slot) {
    switch (game.status) {
      case Finished():
        return const Failure<Game, MoveError>(MoveError.gameOver());
      case CpuTurn():
        return const Failure<Game, MoveError>(MoveError.notYourTurn());
      case PlayerTurn():
        if (!game.board.isFree(slot)) {
          return const Failure<Game, MoveError>(MoveError.slotTaken());
        }

        final Board board = game.board.place(Mark.x, slot);

        return Success<Game, MoveError>(
          game.copyWith(board: board, status: _statusAfter(board, Mark.x)),
        );
    }
  }

  /// Private until it has a second caller.
  GameStatus _statusAfter(Board board, Mark justPlayed) {
    final Set<WinningLine> lines = board.winningLinesFor(justPlayed);
    if (lines.isNotEmpty) {
      return GameStatus.finished(
        outcome: justPlayed == Mark.x ? GameOutcome.won : GameOutcome.lost,
        winningLines: lines,
      );
    }

    if (board.isFull) return const GameStatus.finished(outcome: GameOutcome.drawn);

    return justPlayed == Mark.x ? const GameStatus.cpuTurn() : const GameStatus.playerTurn();
  }
}
