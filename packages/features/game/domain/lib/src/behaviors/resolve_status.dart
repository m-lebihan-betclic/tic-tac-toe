import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/game_status.br.dart';
import 'package:game_domain/src/entities/mark.dart';
import 'package:session_domain/session_domain.dart';

/// What the game becomes once a mark has taken a slot.
///
/// One rule with two callers — the human's move and the CPU's — which is what moved it out of
/// `PlayMove` and into its own file. Outcomes are named from the human's side: X completing a
/// line is a win, O completing one is a loss.
class ResolveStatus {
  const ResolveStatus();

  GameStatus call(Board board, Mark justPlayed) {
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
