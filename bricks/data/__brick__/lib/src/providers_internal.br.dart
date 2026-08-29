import 'package:{{name.snakeCase()}}/src/data_sources/{{classname.snakeCase()}}_in_memory_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

/// `keepAlive` because the session must outlive any single screen watching it.
@Riverpod(keepAlive: true)
{{classname.pascalCase()}}InMemoryDataSource {{classname.camelCase()}}DataSource(Ref ref) =>
    {{classname.pascalCase()}}InMemoryDataSource();
