import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:game_domain/src/entities/board.dart';
import 'package:game_domain/src/entities/game_status.br.dart';
import 'package:session_domain/session_domain.dart';

part 'game.br.freezed.dart';

/// The aggregate: the board, whose turn it is, and the level being played at.
///
/// [difficulty] lives on the game rather than being read from settings at each move, so a level
/// changed mid-round cannot rewrite the round in progress. Settings applies to the next one.
///
/// Scores are deliberately absent. They are derived from finished rounds, which this does not
/// know about — a game is one round, not a session.
@freezed
abstract class Game with _$Game {
  const factory Game({
    required Board board,
    required Difficulty difficulty,
    required GameStatus status,
  }) = _Game;

  /// An empty board at [difficulty], the human to move.
  factory Game.initial({required Difficulty difficulty}) =>
      Game(board: Board.empty, difficulty: difficulty, status: const GameStatus.playerTurn());

  const Game._();
}
