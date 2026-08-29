import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/src/repositories/session_repository.dart';

part 'providers_di.br.g.dart';

// Incoming contracts: they throw until composition feeds them.
// This file is never exported from the package barrel.
@riverpod
SessionRepository sessionRepository(Ref ref) {
  throw UnregisteredProviderException(sessionRepositoryProvider);
}
