import 'package:{{domainPackage.snakeCase()}}/{{domainPackage.snakeCase()}}.dart';

/// Single source: it implements the domain contract directly, so there is no intermediate
/// repository class. Add a `{{classname.snakeCase()}}_repository_single_source.dart` only if
/// the feature ever coordinates more than one source.
///
/// Nothing here is persisted — the session lives in memory and dies with the process. The
/// contract exists so the boundary is real, not because a database is coming.
final class {{classname.pascalCase()}}InMemoryDataSource implements {{repository.pascalCase()}}Repository {
}
