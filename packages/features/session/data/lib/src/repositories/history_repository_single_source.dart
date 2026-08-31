import 'package:session_data/src/data_sources/session_in_memory_data_source.br.dart';
import 'package:session_data/src/data_sources/session_snapshot.br.dart';
import 'package:session_domain/session_domain.dart';

/// Answers [HistoryRepository] from the session store.
///
/// The rounds live in the same snapshot as the player and the preferences, because they are the
/// same session — one store, one `keepAlive`, one thing to lose when the process ends.
final class HistoryRepositorySingleSource implements HistoryRepository {
  final SessionInMemoryDataSource _source;
  final SessionSnapshot _snapshot;

  const HistoryRepositorySingleSource({
    required SessionInMemoryDataSource source,
    required SessionSnapshot snapshot,
  }) : _source = source,
       _snapshot = snapshot;

  @override
  List<Round> read() => _snapshot.rounds;

  @override
  void write(Round round) => _source.writeRound(round);
}
