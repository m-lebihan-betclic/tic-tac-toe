import 'package:session_domain/src/entities/player.dart';
import 'package:session_domain/src/repositories/player_repository.dart';

/// Records who is playing.
class SavePlayer {
  final PlayerRepository _repository;

  const SavePlayer({required PlayerRepository player}) : _repository = player;

  void call(Player player) => _repository.write(player);
}
