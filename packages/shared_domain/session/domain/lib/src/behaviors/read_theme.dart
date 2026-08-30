import 'package:session_domain/src/entities/app_theme.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

/// The stored theme, or null while the platform's own is still in force.
class ReadTheme {
  final PreferencesRepository _repository;

  const ReadTheme({required PreferencesRepository preferences}) : _repository = preferences;

  AppTheme? call() => _repository.readTheme();
}
