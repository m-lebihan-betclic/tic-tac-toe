import 'package:exceptions/exceptions.dart';
import 'package:game_presentation/src/providers_internal.br.dart';
import 'package:game_presentation/src/routing/game_routing.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';

part 'providers_di.br.g.dart';

/// Required: throws until composition feeds it.
@riverpod
GameRouting gameRouting(Ref _) {
  throw UnregisteredProviderException(gameRoutingProvider);
}

/// Required. Who is playing is a session fact, not the board's — composition decides where it
/// comes from, which is what lets the setup sheet write it through a contract this feature never
/// sees.
@riverpod
Player player(Ref _) {
  throw UnregisteredProviderException(playerProvider);
}

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.
@riverpod
GameTheme gameTheme(Ref ref) => ref.watch(defaultGameThemeProvider);
