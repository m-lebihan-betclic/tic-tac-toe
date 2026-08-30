import 'package:session_domain/src/entities/player.dart';
import 'package:session_domain/src/repositories/player_repository.dart';

/// Who is playing, or null if nobody has been set up yet.
class ReadPlayer {
  final PlayerRepository _repository;

  const ReadPlayer({required PlayerRepository player}) : _repository = player;

  Player? call() => _repository.read();
}
