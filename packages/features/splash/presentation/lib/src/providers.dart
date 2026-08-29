import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splash_presentation/src/providers_di.br.dart';
import 'package:splash_presentation/src/routing/splash_routing.dart';
import 'package:splash_presentation/src/theme/splash_theme.br.dart';

// Routing is required — its contract throws until fed. The theme is optional: without it the
// feature renders with its own internal default.
List<Override> bindProviders({
  required SplashRouting Function(Ref ref) routing,
  ProviderListenable<SplashTheme>? theme,
}) => [
  splashRoutingProvider.overrideWith(routing),
  if (theme != null) splashThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
