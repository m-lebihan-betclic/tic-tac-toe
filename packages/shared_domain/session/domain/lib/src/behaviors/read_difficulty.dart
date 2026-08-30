import 'package:session_domain/src/entities/difficulty.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

/// The stored level, or null if none has been chosen.
class ReadDifficulty {
  final PreferencesRepository _repository;

  const ReadDifficulty({required PreferencesRepository preferences}) : _repository = preferences;

  Difficulty? call() => _repository.readDifficulty();
}
