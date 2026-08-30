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
/// [winningLine] is null exactly when the game was drawn.
@freezed
abstract class Round with _$Round {
  const factory Round({
    required Difficulty difficulty,
    required int moveCount,
    required GameOutcome outcome,
    WinningLine? winningLine,
  }) = _Round;
}
