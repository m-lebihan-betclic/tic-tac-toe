import 'package:{{name.snakeCase()}}/src/providers_di.br.dart';
import 'package:{{name.snakeCase()}}/src/repositories/{{classname.snakeCase()}}_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

List<Override> bindProviders({required ProviderListenable<{{classname.pascalCase()}}Repository> repository}) => [
  {{classname.camelCase()}}RepositoryProvider.overrideWith((ref) => ref.watch(repository)),
];

// Public API: expose behaviors as providers — never the raw repository, never a behavior
// instance. A behavior provider returns either the *result* of calling it, or its bare `call`
// when the caller needs to invoke it later.
@riverpod
void dummy{{name.pascalCase()}}(Ref _) {}
