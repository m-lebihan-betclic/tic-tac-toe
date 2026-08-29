import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{name.snakeCase()}}/src/providers_di.br.dart';
import 'package:{{name.snakeCase()}}/src/routing/{{classname.snakeCase()}}_routing.dart';
import 'package:{{name.snakeCase()}}/src/theme/{{classname.snakeCase()}}_theme.br.dart';

// Routing is required — its contract throws until fed. The theme is optional: without it the
// feature renders with its own internal default.
List<Override> bindProviders({
  required {{classname.pascalCase()}}Routing Function(Ref ref) routing,
  ProviderListenable<{{classname.pascalCase()}}Theme>? theme,
}) => [
  {{classname.camelCase()}}RoutingProvider.overrideWith(routing),
  if (theme != null) {{classname.camelCase()}}ThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
