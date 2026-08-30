import 'dart:math';

import 'package:game_domain/game_domain.dart';
import 'package:game_domain/src/behaviors/easy_cpu.dart';
import 'package:game_domain/src/behaviors/hard_cpu.dart';
import 'package:game_domain/src/behaviors/play_cpu_move.dart';
import 'package:game_domain/src/behaviors/play_move.dart';
import 'package:givn/givn.dart';
import 'package:session_domain/session_domain.dart';
import 'package:shouldly/shouldly.dart';

import '../../../support/layout.dart';

/// Names the nth free slot, so a scenario can state the CPU's choice outright instead of
/// depending on the SDK's generator producing the same numbers it produces today.
class _FixedRandom implements Random {
  final int _index;

  const _FixedRandom(this._index);

  @override
  bool nextBool() => false;

  @override
  double nextDouble() => 0;

  @override
  int nextInt(int max) => _index % max;
}

/// Every outcome the human can reach against a deterministic CPU.
///
/// Hard never consults its generator, so only the human's moves branch — which makes this the
/// entire game tree rather than a sample of it. Nine openings, then seven replies, then five:
/// 945 complete games.
Set<GameOutcome> _everyOutcome(Game game) {
  const PlayMove play = PlayMove();
  const PlayCpuMove cpu = PlayCpuMove(
    easy: EasyCpu(random: _FixedRandom(0)),
    hard: HardCpu(),
  );

  switch (game.status) {
    case Finished(:final GameOutcome outcome):
      return <GameOutcome>{outcome};
    case CpuTurn():
      return _everyOutcome(cpu(game).getOrNull()!);
    case PlayerTurn():
      return <GameOutcome>{
        for (final int slot in game.board.freeSlots) ..._everyOutcome(play(game, slot).getOrNull()!),
      };
  }
}

void main() {
  given('the CPU one slot from a line of its own', (_) => boardOf('OO./XX./...'))
      .when('easy chooses', (sut, _) => const EasyCpu(random: _FixedRandom(0)).chooseSlot(sut))
      .then('it takes the win', (result, _) => result.should.be(2));

  given('the player one slot from a line, and nothing for the CPU to win', (_) => boardOf('XX./O../...'))
      .when(
        'easy chooses, its generator naming the second free slot',
        (sut, _) => const EasyCpu(random: _FixedRandom(1)).chooseSlot(sut),
      )
      .then(
        "it plays there and leaves the player's line open — easy does not block",
        (result, _) => result.should.be(4),
      );

  given('a hard game', (_) => Game.initial(difficulty: Difficulty.hard))
      .when('every game the player could possibly play is played out', (sut, _) => _everyOutcome(sut))
      .then('the player never wins one of them', (result, _) {
        result.contains(GameOutcome.won).should.beFalse();
        result.should.contain(GameOutcome.drawn);
      });
}
