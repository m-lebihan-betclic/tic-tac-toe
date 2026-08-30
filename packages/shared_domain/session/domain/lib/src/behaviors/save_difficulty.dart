import 'package:session_domain/src/entities/difficulty.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

/// Records the level. It applies to the next round, never the one in flight.
class SaveDifficulty {
  final PreferencesRepository _repository;

  const SaveDifficulty({required PreferencesRepository preferences}) : _repository = preferences;

  void call(Difficulty difficulty) => _repository.writeDifficulty(difficulty);
}
