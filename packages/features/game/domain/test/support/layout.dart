import 'package:game_domain/game_domain.dart';
import 'package:session_domain/session_domain.dart';

/// Builds a board from three rows of `X`, `O` and `.`, so a scenario's input is visible as the
/// shape it actually is: `boardOf('XX./..O/...')`.
Board boardOf(String rows) {
  final String cells = rows.replaceAll('/', '');
  assert(cells.length == Board.slotCount, 'a board is nine cells, got ${cells.length}');

  Board board = Board.empty;
  for (int slot = 0; slot < cells.length; slot++) {
    board = switch (cells[slot]) {
      'X' => board.place(Mark.x, slot),
      'O' => board.place(Mark.o, slot),
      _ => board,
    };
  }

  return board;
}

/// A game mid-play: [rows] on the board, and whoever [status] says is to move.
Game gameOf(String rows, {required GameStatus status, Difficulty difficulty = Difficulty.easy}) =>
    Game(board: boardOf(rows), difficulty: difficulty, status: status);
