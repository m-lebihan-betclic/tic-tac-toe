import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:setup_presentation/src/providers_di.br.dart';
import 'package:setup_presentation/src/routing/setup_routing.dart';
import 'package:setup_presentation/src/theme/setup_theme.br.dart';

// Routing is required — its contract throws until fed. The theme is optional: without it the
// feature renders with its own internal default.
List<Override> bindProviders({
  required SetupRouting Function(Ref ref) routing,
  ProviderListenable<SetupTheme>? theme,
}) => <Override>[
  setupRoutingProvider.overrideWith(routing),
  if (theme != null) setupThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
