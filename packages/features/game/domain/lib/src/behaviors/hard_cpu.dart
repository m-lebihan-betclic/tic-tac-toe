import 'package:game_domain/src/behaviors/cpu_strategy.dart';
import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/mark.dart';

/// Full minimax. Blocks every threat, takes every win, and cannot be beaten — a played-out game
/// against it ends drawn or lost, never won.
///
/// Scores are depth-adjusted so a win now beats the same win three moves later, and a loss later
/// beats a loss now. Without it the CPU plays a technically-drawn game that looks aimless.
class HardCpu implements CpuStrategy {
  static const int _maxScore = 10;

  const HardCpu();

  @override
  int chooseSlot(Board board) {
    int bestScore = -_maxScore - 1;
    int bestSlot = -1;

    for (final int slot in board.freeSlots) {
      final int score = _score(board.place(Mark.o, slot), Mark.x, 1);
      if (score > bestScore) {
        bestScore = score;
        bestSlot = slot;
      }
    }

    if (bestSlot < 0) {
      throw StateError('chooseSlot on a full board: the status should already be Finished');
    }

    return bestSlot;
  }

  /// The value of [board] to the CPU, with [turn] to move and [depth] plies already played.
  int _score(Board board, Mark turn, int depth) {
    if (board.winningLinesFor(Mark.o).isNotEmpty) return _maxScore - depth;
    if (board.winningLinesFor(Mark.x).isNotEmpty) return depth - _maxScore;
    if (board.isFull) return 0;

    final bool maximising = turn == Mark.o;
    int best = maximising ? -_maxScore - 1 : _maxScore + 1;

    for (final int slot in board.freeSlots) {
      final int value = _score(board.place(turn, slot), maximising ? Mark.x : Mark.o, depth + 1);
      best = maximising ? (value > best ? value : best) : (value < best ? value : best);
    }

    return best;
  }
}
