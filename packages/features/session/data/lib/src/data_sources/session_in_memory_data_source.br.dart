import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_data/src/data_sources/session_snapshot.br.dart';
import 'package:session_domain/session_domain.dart';

part 'session_in_memory_data_source.br.g.dart';

/// The session, held in memory for the life of the process.
///
/// A notifier rather than a mutable object, and that is the whole point: a write replaces the
/// snapshot, so everything reading the session rebuilds. A plain class with fields would store
/// the value correctly and tell nobody, which is a bug that looks like a design.
///
/// `keepAlive` is load-bearing. Without it the store is disposed the moment no screen watches,
/// and the session evaporates — the nickname would survive right up until the player opened
/// settings and came back.
@Riverpod(keepAlive: true)
class SessionInMemoryDataSource extends _$SessionInMemoryDataSource {
  @override
  SessionSnapshot build() => const SessionSnapshot();

  void writeDifficulty(Difficulty difficulty) => state = state.copyWith(difficulty: difficulty);

  void writeLocale(AppLocale locale) => state = state.copyWith(locale: locale);

  /// Prepended, not appended: newest first is the order the history is read in, so the list is
  /// kept that way rather than reversed by every reader.
  void writeRound(Round round) => state = state.copyWith(rounds: <Round>[round, ...state.rounds]);

  void writePlayer(Player player) => state = state.copyWith(player: player);

  void writeTheme(AppTheme theme) => state = state.copyWith(theme: theme);
}
