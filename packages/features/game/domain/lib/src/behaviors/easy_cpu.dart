import 'dart:math';

import 'package:game_domain/src/behaviors/cpu_strategy.dart';
import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/mark.dart';

/// Takes a win when one is on offer, and otherwise plays at random.
///
/// It does **not** block, which is the point: easy exists so the win screen is reachable in
/// review, and a perfect opponent means nobody ever sees it. An unreachable screen may as well
/// not be built.
///
/// [Random] arrives through the constructor. A bare `Random()` in here would make both the unit
/// tests and the goldens non-deterministic, and the hour spent finding out why is not one anybody
/// gets back.
class EasyCpu implements CpuStrategy {
  final Random _random;

  const EasyCpu({required Random random}) : _random = random;

  @override
  int chooseSlot(Board board) {
    final List<int> free = board.freeSlots.toList(growable: false);
    if (free.isEmpty) {
      throw StateError('chooseSlot on a full board: the status should already be Finished');
    }

    for (final int slot in free) {
      if (board.place(Mark.o, slot).winningLinesFor(Mark.o).isNotEmpty) return slot;
    }

    return free[_random.nextInt(free.length)];
  }
}
