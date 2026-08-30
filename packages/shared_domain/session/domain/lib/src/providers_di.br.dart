import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/src/repositories/history_repository.dart';
import 'package:session_domain/src/repositories/player_repository.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

part 'providers_di.br.g.dart';

// Incoming contracts: they throw until composition feeds them.
// This file is never exported from the package barrel.

@riverpod
HistoryRepository historyRepository(Ref ref) {
  throw UnregisteredProviderException(historyRepositoryProvider);
}

@riverpod
PlayerRepository playerRepository(Ref ref) {
  throw UnregisteredProviderException(playerRepositoryProvider);
}

@riverpod
PreferencesRepository preferencesRepository(Ref ref) {
  throw UnregisteredProviderException(preferencesRepositoryProvider);
}
