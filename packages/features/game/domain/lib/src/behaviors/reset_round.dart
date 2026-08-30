import 'package:game_domain/src/entities/game.br.dart';

/// Clears the board mid-round, keeping the level the round is being played at.
///
/// Scores survive because they are not here: they are derived from finished rounds, and a reset
/// finishes nothing. That is also why a reset is not a loss.
class ResetRound {
  const ResetRound();

  Game call(Game game) => Game.initial(difficulty: game.difficulty);
}
