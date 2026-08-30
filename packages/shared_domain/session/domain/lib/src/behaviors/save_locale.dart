import 'package:session_domain/src/entities/app_locale.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

/// Records the language.
class SaveLocale {
  final PreferencesRepository _repository;

  const SaveLocale({required PreferencesRepository preferences}) : _repository = preferences;

  void call(AppLocale locale) => _repository.writeLocale(locale);
}
