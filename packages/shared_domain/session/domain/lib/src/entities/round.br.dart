import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:session_domain/src/entities/difficulty.dart';
import 'package:session_domain/src/entities/game_outcome.dart';
import 'package:session_domain/src/entities/winning_line.dart';

part 'round.br.freezed.dart';

/// One finished game.
///
/// [difficulty] is not decoration. Settings can change the level while a round is in flight, and
/// the round has to keep the level it started at — otherwise a player switches to easy one move
/// from losing and the history says they beat `hard`.
///
/// [winningLines] is empty exactly when the game was drawn, and holds two when a single move
/// completed two lines. A `WinningLine?` here would have looked right for a long time before it
/// quietly dropped one.
@freezed
abstract class Round with _$Round {
  const factory Round({
    required Difficulty difficulty,
    required int moveCount,
    required GameOutcome outcome,
    @Default(<WinningLine>{}) Set<WinningLine> winningLines,
  }) = _Round;
}
