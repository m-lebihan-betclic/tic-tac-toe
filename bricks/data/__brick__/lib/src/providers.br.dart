import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';
import 'package:{{name.snakeCase()}}/src/providers_internal.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.br.g.dart';

/// The public implementation provider, typed as the *domain* interface. Composition hands this
/// to the domain's `bindProviders(repository: …)`.
@riverpod
{{repository.pascalCase()}}Repository {{repository.camelCase()}}Repository(Ref ref) =>
    ref.watch({{classname.camelCase()}}DataSourceProvider);
