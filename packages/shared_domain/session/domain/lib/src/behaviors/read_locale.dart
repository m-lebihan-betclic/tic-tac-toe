import 'package:session_domain/src/entities/app_locale.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

/// The stored language, or null while the device's own is still in force.
class ReadLocale {
  final PreferencesRepository _repository;

  const ReadLocale({required PreferencesRepository preferences}) : _repository = preferences;

  AppLocale? call() => _repository.readLocale();
}
