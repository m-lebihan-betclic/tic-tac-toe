import 'package:session_domain/src/entities/app_theme.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

/// Records the theme.
class SaveTheme {
  final PreferencesRepository _repository;

  const SaveTheme({required PreferencesRepository preferences}) : _repository = preferences;

  void call(AppTheme theme) => _repository.writeTheme(theme);
}
