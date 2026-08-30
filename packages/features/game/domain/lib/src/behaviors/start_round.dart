import 'package:game_domain/src/entities/game.br.dart';
import 'package:session_domain/session_domain.dart';

/// Begins a round at [Difficulty]. The human always moves first.
class StartRound {
  const StartRound();

  Game call({required Difficulty difficulty}) => Game.initial(difficulty: difficulty);
}
