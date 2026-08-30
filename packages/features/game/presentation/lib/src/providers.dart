import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/routing/game_routing.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';

// Routing and the player are required — their contracts throw until fed. The theme is optional:
// without it the feature renders with its own internal default.
List<Override> bindProviders({
  required ProviderListenable<Player> player,
  required GameRouting Function(Ref ref) routing,
  ProviderListenable<GameTheme>? theme,
}) => <Override>[
  gameRoutingProvider.overrideWith(routing),
  playerProvider.overrideWith((ref) => ref.watch(player)),
  if (theme != null) gameThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
