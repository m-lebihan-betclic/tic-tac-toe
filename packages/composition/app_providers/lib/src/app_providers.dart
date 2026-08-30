import 'package:app_router/app_router.dart';
import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpod 3 splits its exports: `Override`, `ProviderListenable` and friends are in misc.dart,
// not in the everyday barrel.
import 'package:flutter_riverpod/misc.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:session_domain/session_domain.dart';
import 'package:setup_data/setup_data.dart' as setup_data;
import 'package:setup_presentation/setup_presentation.dart' as setup_presentation;
import 'package:splash_presentation/splash_presentation.dart' as splash_presentation;

/// The composition root: the only place in the app that knows every feature at once.
///
/// Each feature declares contracts that throw until they are fed, and exposes exactly one
/// `bindProviders()` to feed them. Nothing here reaches into a feature's `providers_di` —
/// that file is package-internal, and a contract left unfed fails loudly on first build rather
/// than rendering a screen that is quietly missing half its wiring.
List<Override> appProviders() => [
  ...design_providers.bindProviders(
    palette: _platformPaletteProvider,
    typography: _platformTypographyProvider,
  ),
  // The data layer first: it feeds the session contracts the features read through.
  ...setup_data.bindProviders(),
  ...game_presentation.bindProviders(
    player: _playerProvider,
    routing: (ref) => AppGameRouting(router: ref.watch(appRouterProvider)),
  ),
  ...setup_presentation.bindProviders(
    routing: (ref) => AppSetupRouting(router: ref.watch(appRouterProvider)),
  ),
  ...splash_presentation.bindProviders(
    routing: (ref) => AppSplashRouting(
      router: ref.watch(appRouterProvider),
      setupBarrierColor: ref.watch(_platformPaletteProvider).background.withValues(alpha: _setupBarrierOpacity),
    ),
  ),
];

/// Where the board's player comes from — composition's decision, which is the whole reason the
/// board takes it as a contract rather than reading storage itself.
///
/// The fallback is unreachable in practice: the sheet gates the board and cannot be dismissed
/// without naming somebody. It exists so the type stays non-null rather than pushing an
/// impossible case into every widget that shows a name.
final Provider<Player> _playerProvider = Provider<Player>(
  (ref) => ref.watch(storedPlayerProvider) ?? Player.create('Player').getOrNull()!,
);

/// The board stays visible behind the sheet at 18% of itself, so the barrier covers the rest.
const double _setupBarrierOpacity = 0.82;

/// Nothing is persisted, so on a cold start there is no stored preference to read: the app
/// opens in the platform's own light or dark. The splash is specified to be system light or
/// dark and never matrix, which is exactly this.
final Provider<Brightness> _platformBrightnessProvider = Provider<Brightness>(
  (ref) => WidgetsBinding.instance.platformDispatcher.platformBrightness,
);

/// The player's choice once there is one, the platform's own until then. Mapping an `AppTheme` to
/// an `AppPalette` happens here and nowhere else, which is what lets a theme be stored without the
/// storage layer ever seeing a `Color`.
final Provider<AppPalette> _platformPaletteProvider = Provider<AppPalette>(
  (ref) => switch (ref.watch(storedThemeProvider)) {
    AppTheme.dark => AppPalette.dark(),
    AppTheme.light => AppPalette.light(),
    AppTheme.matrix => AppPalette.matrix(),
    null => switch (ref.watch(_platformBrightnessProvider)) {
      Brightness.dark => AppPalette.dark(),
      Brightness.light => AppPalette.light(),
    },
  },
);

/// Matrix swaps the sans styles for the platform monospace, so the type follows the theme too.
final Provider<AppTypography> _platformTypographyProvider = Provider<AppTypography>(
  (ref) => AppTypography.system(monospace: ref.watch(storedThemeProvider) == AppTheme.matrix),
);
