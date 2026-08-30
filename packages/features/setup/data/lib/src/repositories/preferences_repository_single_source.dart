import 'package:session_domain/session_domain.dart';
import 'package:setup_data/src/data_sources/session_in_memory_data_source.br.dart';
import 'package:setup_data/src/data_sources/session_snapshot.br.dart';

/// Answers [PreferencesRepository] from the session store.
///
/// Reads come off the snapshot and writes go to the store, so a preference changing rebuilds
/// everything that reads one — which is what makes a theme chip repaint the app.
final class PreferencesRepositorySingleSource implements PreferencesRepository {
  final SessionInMemoryDataSource _source;
  final SessionSnapshot _snapshot;

  const PreferencesRepositorySingleSource({
    required SessionInMemoryDataSource source,
    required SessionSnapshot snapshot,
  }) : _source = source,
       _snapshot = snapshot;

  @override
  Difficulty? readDifficulty() => _snapshot.difficulty;

  @override
  AppLocale? readLocale() => _snapshot.locale;

  @override
  AppTheme? readTheme() => _snapshot.theme;

  @override
  void writeDifficulty(Difficulty difficulty) => _source.writeDifficulty(difficulty);

  @override
  void writeLocale(AppLocale locale) => _source.writeLocale(locale);

  @override
  void writeTheme(AppTheme theme) => _source.writeTheme(theme);
}
