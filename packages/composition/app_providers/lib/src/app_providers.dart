import 'package:app_router/app_router.dart';
import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpod 3 splits its exports: `Override`, `ProviderListenable` and friends are in misc.dart,
// not in the everyday barrel.
import 'package:flutter_riverpod/misc.dart';
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
  ...splash_presentation.bindProviders(
    routing: (ref) => AppSplashRouting(router: ref.watch(appRouterProvider)),
  ),
];

/// Nothing is persisted, so on a cold start there is no stored preference to read: the app
/// opens in the platform's own light or dark. The splash is specified to be system light or
/// dark and never matrix, which is exactly this.
final Provider<Brightness> _platformBrightnessProvider = Provider<Brightness>(
  (ref) => WidgetsBinding.instance.platformDispatcher.platformBrightness,
);

final Provider<AppPalette> _platformPaletteProvider = Provider<AppPalette>(
  (ref) => switch (ref.watch(_platformBrightnessProvider)) {
    Brightness.dark => AppPalette.dark(),
    Brightness.light => AppPalette.light(),
  },
);

final Provider<AppTypography> _platformTypographyProvider = Provider<AppTypography>(
  (ref) => AppTypography.system(),
);
