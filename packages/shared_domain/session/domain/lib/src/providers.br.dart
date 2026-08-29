import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/src/providers_di.br.dart';
import 'package:session_domain/src/repositories/session_repository.dart';

part 'providers.br.g.dart';

List<Override> bindProviders({required ProviderListenable<SessionRepository> repository}) => [
  sessionRepositoryProvider.overrideWith((ref) => ref.watch(repository)),
];

// Public API: expose behaviors as providers — never the raw repository, never a behavior
// instance. A behavior provider returns either the *result* of calling it, or its bare `call`
// when the caller needs to invoke it later.
@riverpod
void dummySessionDomain(Ref _) {}
