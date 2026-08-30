import 'package:game_domain/game_domain.dart';
import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:shouldly/shouldly.dart';

import '../../../support/layout.dart';

const Map<WinningLine, String> _lines = <WinningLine, String>{
  WinningLine.topRow: 'XXX/.../...',
  WinningLine.middleRow: '.../XXX/...',
  WinningLine.bottomRow: '.../.../XXX',
  WinningLine.leftColumn: 'X../X../X..',
  WinningLine.middleColumn: '.X./.X./.X.',
  WinningLine.rightColumn: '..X/..X/..X',
  WinningLine.diagonalDown: 'X../.X./..X',
  WinningLine.diagonalUp: '..X/.X./X..',
};

void main() {
  for (final MapEntry<WinningLine, String> line in _lines.entries) {
    given('three marks along the ${line.key.name}', (_) => boardOf(line.value))
        .when('the board is asked what has been won', (sut, _) => sut.winningLinesFor(Mark.x))
        .then('it reports that line and only that line', (result, _) {
          result.should.haveCount(1);
          result.should.contain(line.key);
        });
  }

  given('a board where two marks share a line', (_) => boardOf('XX./.../...'))
      .when('the board is asked what has been won', (sut, _) => sut.winningLinesFor(Mark.x))
      .then('nothing is won yet', (result, _) => result.should.beEmpty());

  given('a position where one square completes both the top row and the falling diagonal',
          (_) => boardOf('.XX/OXO/OOX'))
      .when('the player takes that square', (sut, _) => sut.place(Mark.x, 0).winningLinesFor(Mark.x))
      .then('both lines are reported, not one of them', (result, _) {
        result.should.haveCount(2);
        result.should.contain(WinningLine.topRow);
        result.should.contain(WinningLine.diagonalDown);
      });

  given('a full board with no three in a line', (_) => boardOf('XXO/OOX/XXO'))
      .when('the board is asked whether it is finished', (sut, _) => sut.isFull)
      .then('it is, and nobody has won', (result, _) {
        result.should.beTrue();
        boardOf('XXO/OOX/XXO').winningLinesFor(Mark.x).should.beEmpty();
        boardOf('XXO/OOX/XXO').winningLinesFor(Mark.o).should.beEmpty();
      });
}
