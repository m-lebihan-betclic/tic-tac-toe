import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{name.snakeCase()}}/src/providers_internal.br.dart';
import 'package:{{name.snakeCase()}}/src/routing/{{classname.snakeCase()}}_routing.dart';
import 'package:{{name.snakeCase()}}/src/theme/{{classname.snakeCase()}}_theme.br.dart';

part 'providers_di.br.g.dart';

/// Required: throws until composition feeds it.
@riverpod
{{classname.pascalCase()}}Routing {{classname.camelCase()}}Routing(Ref _) {
  throw UnregisteredProviderException({{classname.camelCase()}}RoutingProvider);
}

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.
@riverpod
{{classname.pascalCase()}}Theme {{classname.camelCase()}}Theme(Ref ref) =>
    ref.watch(default{{classname.pascalCase()}}ThemeProvider);
