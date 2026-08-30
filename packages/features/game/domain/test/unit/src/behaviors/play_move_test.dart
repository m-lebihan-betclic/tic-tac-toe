import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/play_move.dart';
import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:shouldly/shouldly.dart';

import '../../../support/layout.dart';

void main() {
  given('an empty board', (_) => Game.initial(difficulty: Difficulty.easy))
      .when('the player takes the centre square', (sut, _) => const PlayMove()(sut, 4))
      .then("the mark is placed and it becomes the CPU's turn", (result, _) {
        final Game game = result.getOrNull()!;
        game.board.markAt(4).should.be(Mark.x);
        game.status.should.be(const GameStatus.cpuTurn());
      });

  given('a square that already holds a mark', (_) => gameOf('X../.../...', status: const GameStatus.playerTurn()))
      .when('the player takes it again', (sut, _) => const PlayMove()(sut, 0))
      .then('the move is refused and the board is untouched', (result, _) {
        result.exceptionOrNull().should.be(const MoveError.slotTaken());
        result.getOrNull().should.beNull();
      });

  given('a game waiting on the CPU', (_) => gameOf('X../.../...', status: const GameStatus.cpuTurn()))
      .when('the player takes a free square anyway', (sut, _) => const PlayMove()(sut, 1))
      .then(
        'the move is refused as out of turn',
        (result, _) => result.exceptionOrNull().should.be(const MoveError.notYourTurn()),
      );

  given(
        'a game that is already over',
        (_) => gameOf(
          'XXX/OO./...',
          status: const GameStatus.finished(
            outcome: GameOutcome.won,
            winningLines: <WinningLine>{WinningLine.topRow},
          ),
        ),
      )
      .when('the player takes a free square', (sut, _) => const PlayMove()(sut, 5))
      .then(
        'the move is refused because the game is over',
        (result, _) => result.exceptionOrNull().should.be(const MoveError.gameOver()),
      );

  given(
    'two marks in a line with the third square free',
    (_) => gameOf('XX./OO./...', status: const GameStatus.playerTurn()),
  ).when('the player takes the third', (sut, _) => const PlayMove()(sut, 2)).then(
    'the game is won, carrying the line that won it',
    (result, _) {
      result.getOrNull()!.status.should.be(
        const GameStatus.finished(
          outcome: GameOutcome.won,
          winningLines: <WinningLine>{WinningLine.topRow},
        ),
      );
    },
  );

  given(
    'a board one square from full with no line available',
    (_) => gameOf('XXO/OOX/XO.', status: const GameStatus.playerTurn()),
  ).when('the player fills the last square', (sut, _) => const PlayMove()(sut, 8)).then(
    'the game is drawn and no line is reported',
    (result, _) {
      result.getOrNull()!.status.should.be(const GameStatus.finished(outcome: GameOutcome.drawn));
    },
  );
}
