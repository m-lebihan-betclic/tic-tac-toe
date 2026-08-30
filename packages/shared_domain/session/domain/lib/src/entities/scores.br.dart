import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:session_domain/src/entities/game_outcome.dart';
import 'package:session_domain/src/entities/round.br.dart';

part 'scores.br.freezed.dart';

/// The session tally.
///
/// Derived from the rounds rather than stored beside them, and that is the whole decision: two
/// counters that must agree can disagree, and a score that drifts from the history it summarises
/// is the kind of bug nothing catches. There is one source of truth — the round list — and this
/// is a projection of it.
///
/// The cost is a walk over the rounds; a session that reaches even a hundred games is a list of
/// a hundred enums, so the incrementing version buys nothing worth the second source of truth.
@freezed
abstract class Scores with _$Scores {
  const factory Scores({
    @Default(0) int drawn,
    @Default(0) int lost,
    @Default(0) int won,
  }) = _Scores;

  factory Scores.fromRounds(Iterable<Round> rounds) {
    int drawn = 0;
    int lost = 0;
    int won = 0;

    for (final Round round in rounds) {
      switch (round.outcome) {
        case GameOutcome.drawn:
          drawn++;
        case GameOutcome.lost:
          lost++;
        case GameOutcome.won:
          won++;
      }
    }

    return Scores(drawn: drawn, lost: lost, won: won);
  }

  const Scores._();

  /// Every round played this session.
  int get played => drawn + lost + won;
}
