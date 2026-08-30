import 'package:game_domain/src/behaviors/cpu_strategy.dart';
import 'package:game_domain/src/behaviors/resolve_status.dart';
import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/entities/game_status.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:game_domain/src/entities/move_error.br.dart';
import 'package:session_domain/session_domain.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// The CPU takes its slot, at the level the round is being played at.
///
/// The level is read from the game rather than from settings, so changing difficulty mid-round
/// cannot change the opponent halfway through it.
///
/// There is no delay here. The 700ms thinking beat is presentation — it is what the player sees
/// while nothing is happening — and a duration in this package would be a rule that isn't one,
/// and a test that has to wait.
class PlayCpuMove {
  final CpuStrategy _easy;
  final CpuStrategy _hard;
  final ResolveStatus _resolveStatus;

  const PlayCpuMove({
    required CpuStrategy easy,
    required CpuStrategy hard,
    ResolveStatus resolveStatus = const ResolveStatus(),
  }) : _easy = easy,
       _hard = hard,
       _resolveStatus = resolveStatus;

  Result<Game, MoveError> call(Game game) {
    switch (game.status) {
      case Finished():
        return const Failure<Game, MoveError>(MoveError.gameOver());
      case PlayerTurn():
        return const Failure<Game, MoveError>(MoveError.notYourTurn());
      case CpuTurn():
        final CpuStrategy strategy = switch (game.difficulty) {
          Difficulty.easy => _easy,
          Difficulty.hard => _hard,
        };
        final Board board = game.board.place(Mark.o, strategy.chooseSlot(game.board));

        return Success<Game, MoveError>(
          game.copyWith(board: board, status: _resolveStatus(board, Mark.o)),
        );
    }
  }
}
