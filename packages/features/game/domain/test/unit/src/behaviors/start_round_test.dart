import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/start_round.dart';
import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('nothing but a chosen level', (_) => Difficulty.hard)
      .when('a round begins', (sut, _) => const StartRound()(difficulty: sut))
      .then(
        "the board is empty and it is the player's turn",
        (result, _) => result.should.be(Game.initial(difficulty: Difficulty.hard)),
      );

  given('a round being played on easy', (_) => Game.initial(difficulty: Difficulty.easy))
      .when('the next round is started on hard', (sut, _) => (sut, const StartRound()(difficulty: Difficulty.hard)))
      .then('the new round is hard and the finished one still says easy', (result, _) {
        result.$2.difficulty.should.be(Difficulty.hard);
        result.$1.difficulty.should.be(Difficulty.easy);
      });
}
