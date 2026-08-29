import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart' as {{domainPackage.snakeCase()}};
import 'package:{{name.snakeCase()}}/src/providers.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> bindProviders() => [
  ...{{domainPackage.snakeCase()}}.bindProviders(repository: {{repository.camelCase()}}RepositoryProvider),
];
