import 'package:session_data/src/data_sources/session_in_memory_data_source.br.dart';
import 'package:session_data/src/data_sources/session_snapshot.br.dart';
import 'package:session_domain/session_domain.dart';

/// Answers [PlayerRepository] from the session store.
///
/// The contract says nothing about where the player lives, and this is the only class that knows
/// — which is what lets the sheet write a name without being able to see that it lands in memory
/// rather than on disk.
final class PlayerRepositorySingleSource implements PlayerRepository {
  final SessionInMemoryDataSource _source;
  final SessionSnapshot _snapshot;

  const PlayerRepositorySingleSource({
    required SessionInMemoryDataSource source,
    required SessionSnapshot snapshot,
  }) : _source = source,
       _snapshot = snapshot;

  @override
  Player? read() => _snapshot.player;

  @override
  void write(Player player) => _source.writePlayer(player);
}
