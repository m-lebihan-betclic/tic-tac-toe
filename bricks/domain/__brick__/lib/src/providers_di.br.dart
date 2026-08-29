import 'package:exceptions/exceptions.dart';
import 'package:{{name.snakeCase()}}/src/repositories/{{classname.snakeCase()}}_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

// Incoming contracts: they throw until composition feeds them.
// This file is never exported from the package barrel.
@riverpod
{{classname.pascalCase()}}Repository {{classname.camelCase()}}Repository(Ref ref) {
  throw UnregisteredProviderException({{classname.camelCase()}}RepositoryProvider);
}
