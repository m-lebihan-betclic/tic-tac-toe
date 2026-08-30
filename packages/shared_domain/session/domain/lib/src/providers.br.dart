import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/src/providers_di.br.dart';
import 'package:session_domain/src/repositories/history_repository.dart';
import 'package:session_domain/src/repositories/player_repository.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

part 'providers.br.g.dart';

/// Three contracts rather than one, because they have three reasons to change and three
/// independent seams: history is droppable, preferences outlive a round, and the player is
/// written from two different features. Composition can swap any one of them without touching
/// the others.
List<Override> bindProviders({
  required ProviderListenable<HistoryRepository> history,
  required ProviderListenable<PlayerRepository> player,
  required ProviderListenable<PreferencesRepository> preferences,
}) => [
  historyRepositoryProvider.overrideWith((ref) => ref.watch(history)),
  playerRepositoryProvider.overrideWith((ref) => ref.watch(player)),
  preferencesRepositoryProvider.overrideWith((ref) => ref.watch(preferences)),
];

// Public API: expose behaviors as providers — never the raw repository, never a behavior
// instance. A behavior provider returns either the *result* of calling it, or its bare `call`
// when the caller needs to invoke it later.
@riverpod
void dummySessionDomain(Ref _) {}
