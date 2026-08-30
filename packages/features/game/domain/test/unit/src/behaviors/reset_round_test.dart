import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/reset_round.dart';
import 'package:game_domain/src/behaviors/start_round.dart';
import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:shouldly/shouldly.dart';

import '../../../support/layout.dart';

void main() {
  given(
        'a game in progress on a hard board',
        (_) => gameOf(
          'XO./.X./...',
          status: const GameStatus.cpuTurn(),
          difficulty: Difficulty.hard,
        ),
      )
      .when('the player resets the round', (sut, _) => const ResetRound()(sut))
      .then(
        "the board is empty, it is the player's turn, and the level is unchanged",
        (result, _) => result.should.be(Game.initial(difficulty: Difficulty.hard)),
      );

  given('a round being played on easy', (_) => Game.initial(difficulty: Difficulty.easy))
      .when('the next round is started on hard', (sut, _) => (sut, const StartRound()(difficulty: Difficulty.hard)))
      .then('the new round is hard and the finished one still says easy', (result, _) {
        result.$2.difficulty.should.be(Difficulty.hard);
        result.$1.difficulty.should.be(Difficulty.easy);
      });
}
