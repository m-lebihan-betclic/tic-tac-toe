import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_data/src/data_sources/session_in_memory_data_source.br.dart';
import 'package:session_data/src/repositories/player_repository_single_source.dart';
import 'package:session_data/src/repositories/preferences_repository_single_source.dart';
import 'package:session_domain/session_domain.dart';

part 'providers.br.g.dart';

/// The public implementation providers, typed as the *domain* interfaces.
///
/// Both watch the store's state as well as reading its notifier, so a write rebuilds them and
/// everything downstream. That is the whole notification chain: store → repository → the domain's
/// read providers → the screen.
@riverpod
PlayerRepository playerRepository(Ref ref) => PlayerRepositorySingleSource(
  snapshot: ref.watch(sessionInMemoryDataSourceProvider),
  source: ref.watch(sessionInMemoryDataSourceProvider.notifier),
);

@riverpod
PreferencesRepository preferencesRepository(Ref ref) => PreferencesRepositorySingleSource(
  snapshot: ref.watch(sessionInMemoryDataSourceProvider),
  source: ref.watch(sessionInMemoryDataSourceProvider.notifier),
);
