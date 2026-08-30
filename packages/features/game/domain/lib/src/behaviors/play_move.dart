import 'package:game_domain/src/behaviors/resolve_status.dart';
import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/entities/game_status.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/move_error.br.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// The human takes a slot.
///
/// Returns a failure *value* rather than throwing: the three rejections are three cases on one
/// signature the compiler forces the caller to handle.
class PlayMove {
  final ResolveStatus _resolveStatus;

  const PlayMove({ResolveStatus resolveStatus = const ResolveStatus()}) : _resolveStatus = resolveStatus;

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
          game.copyWith(board: board, status: _resolveStatus(board, Mark.x)),
        );
    }
  }
}
