import 'package:game_domain/src/entities/mark.dart';
import 'package:meta/meta.dart';
import 'package:session_domain/session_domain.dart';

/// The nine slots, held as two nine-bit masks — one per mark.
///
/// Two integers rather than a `List<Mark?>` because minimax copies a board at every node it
/// searches, and copying two ints is free where copying a nine-element list is not. A win check
/// costs eight masked comparisons instead of eight triples of index lookups.
///
/// The encoding does not leave this file. Callers ask [markAt], [isFree] and [winningLinesFor];
/// nothing outside knows a bit exists, which is what lets the layout change without breaking a
/// widget. Slots are numbered in reading order:
///
/// ```text
/// 0 1 2
/// 3 4 5
/// 6 7 8
/// ```
@immutable
class Board {
  static const Board empty = Board._(0, 0);
  static const int slotCount = 9;

  static const int _all = 0x1FF;

  /// The eight winning lines as masks over the same bit layout. They live here, with the
  /// encoding they are written in, rather than in a behavior that would have to be told how a
  /// board is stored in order to express them.
  ///
  /// The order is not cosmetic: a move can complete two lines at once, and [winningLinesFor]
  /// reports the first match. Rows, then diagonals, then columns is the order the win line is
  /// drawn in.
  static const Map<WinningLine, int> _lines = <WinningLine, int>{
    WinningLine.bottomRow: 0x1C0,
    WinningLine.middleRow: 0x038,
    WinningLine.topRow: 0x007,
    WinningLine.diagonalDown: 0x111,
    WinningLine.diagonalUp: 0x054,
    WinningLine.leftColumn: 0x049,
    WinningLine.middleColumn: 0x092,
    WinningLine.rightColumn: 0x124,
  };

  /// The CPU's marks. The CPU is always [Mark.o], and always moves second.
  final int _o;

  /// The human's marks. The human is always [Mark.x], and always moves first.
  final int _x;

  const Board._(this._o, this._x);

  /// Every slot nobody has taken, in reading order. This is what the CPU searches.
  Iterable<int> get freeSlots sync* {
    final int taken = _o | _x;
    for (int slot = 0; slot < slotCount; slot++) {
      if (taken & (1 << slot) == 0) yield slot;
    }
  }

  @override
  int get hashCode => Object.hash(_o, _x);

  bool get isFull => (_o | _x) == _all;

  /// How many marks are on the board — a round's move count when it ends.
  int get moveCount => _popCount(_o) + _popCount(_x);

  bool isFree(int slot) => (_o | _x) & _bit(slot) == 0;

  Mark? markAt(int slot) {
    final int bit = _bit(slot);
    if (_x & bit != 0) return Mark.x;
    if (_o & bit != 0) return Mark.o;

    return null;
  }

  /// The board that results from [mark] taking [slot]. Whether the slot was free is a rule, and
  /// rules are the behaviors' business — this only places.
  Board place(Mark mark, int slot) => switch (mark) {
    Mark.o => Board._(_o | _bit(slot), _x),
    Mark.x => Board._(_o, _x | _bit(slot)),
  };

  /// Every line [mark] has completed, in [_lines] order. Empty when there is no win.
  ///
  /// A set rather than one line, because a single move can finish two: X holding 1, 2, 4 and 8
  /// takes slot 0 and completes both the top row and the falling diagonal, reached by the legal
  /// sequence X1 O3 X2 O5 X4 O6 X8 O7 X0 with nobody winning a move earlier. Returning one of
  /// them would be the domain discarding something it knows, and would leave presentation unable
  /// to draw what actually happened.
  Set<WinningLine> winningLinesFor(Mark mark) {
    final int marks = switch (mark) {
      Mark.o => _o,
      Mark.x => _x,
    };
    return <WinningLine>{
      for (final MapEntry<WinningLine, int> line in _lines.entries)
        if (marks & line.value == line.value) line.key,
    };
  }

  @override
  bool operator ==(Object other) => other is Board && other._o == _o && other._x == _x;

  @override
  String toString() {
    final StringBuffer buffer = StringBuffer('Board(');
    for (int slot = 0; slot < slotCount; slot++) {
      buffer.write(switch (markAt(slot)) {
        Mark.o => 'O',
        Mark.x => 'X',
        null => '.',
      });
      if (slot % 3 == 2 && slot != slotCount - 1) buffer.write('/');
    }

    return (buffer..write(')')).toString();
  }

  /// An out-of-range slot is a programming error, not a rejected move: nothing in the UI can
  /// produce one, so it throws rather than becoming a fourth `MoveError` nobody can trigger.
  static int _bit(int slot) {
    if (slot < 0 || slot >= slotCount) {
      throw RangeError.range(slot, 0, slotCount - 1, 'slot');
    }

    return 1 << slot;
  }

  static int _popCount(int bits) {
    int count = 0;
    for (int remaining = bits; remaining != 0; remaining >>= 1) {
      count += remaining & 1;
    }

    return count;
  }
}
