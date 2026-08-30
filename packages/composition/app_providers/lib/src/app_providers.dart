import 'package:app_router/app_router.dart';
import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Riverpod 3 splits its exports: `Override`, `ProviderListenable` and friends are in misc.dart,
// not in the everyday barrel.
import 'package:flutter_riverpod/misc.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:session_data/session_data.dart' as session_data;
import 'package:session_domain/session_domain.dart';
import 'package:settings_presentation/settings_presentation.dart' as settings_presentation;
import 'package:setup_presentation/setup_presentation.dart' as setup_presentation;
import 'package:splash_presentation/splash_presentation.dart' as splash_presentation;

/// The composition root: the only place in the app that knows every feature at once.
///
/// Each feature declares contracts that throw until they are fed, and exposes exactly one
/// `bindProviders()` to feed them. Nothing here reaches into a feature's `providers_di` —
/// that file is package-internal, and a contract left unfed fails loudly on first build rather
/// than rendering a screen that is quietly missing half its wiring.
/// [version] is the app's own, read off the bundle in `main()` — see `buildApplication`.
List<Override> appProviders({required String version}) => [
  ...design_providers.bindProviders(
    palette: _paletteProvider,
    typography: _typographyProvider,
  ),
  // The data layer first: it feeds the session contracts the features read through.
  ...session_data.bindProviders(),
  ...game_presentation.bindProviders(
    player: _playerProvider,
    routing: (ref) => AppGameRouting(router: ref.watch(appRouterProvider)),
  ),
  ...settings_presentation.bindProviders(
    locale: activeLocaleProvider,
    player: _playerProvider,
    routing: (ref) => AppSettingsRouting(router: ref.watch(appRouterProvider)),
    theme: _activeThemeProvider,
    version: Provider<String>((_) => version),
  ),
  ...setup_presentation.bindProviders(
    routing: (ref) => AppSetupRouting(router: ref.watch(appRouterProvider)),
  ),
  ...splash_presentation.bindProviders(
    routing: (ref) => AppSplashRouting(
      router: ref.watch(appRouterProvider),
      setupBarrierColor: ref.watch(_paletteProvider).background.withValues(alpha: _setupBarrierOpacity),
    ),
  ),
];

/// The language the app is actually speaking: the player's choice once there is one, and until
/// then whichever of the two the device asked for.
///
/// Public, because `MaterialApp` needs it as much as the settings screen does. Resolving it here
/// rather than in a `localeResolutionCallback` is what lets both read the same answer — a screen
/// cannot ask `MaterialApp` what it decided, and a second copy of the rule is a second rule.
final Provider<AppLocale> activeLocaleProvider = Provider<AppLocale>(
  (ref) => ref.watch(storedLocaleProvider) ?? ref.watch(_deviceLocaleProvider),
);

/// [activeLocaleProvider] as Flutter spells it. An explicit map rather than `AppLocale.name`,
/// because a language tag that happens to match an enum constant is a coincidence, not a contract.
final Provider<Locale> localeProvider = Provider<Locale>(
  (ref) => switch (ref.watch(activeLocaleProvider)) {
    AppLocale.en => const Locale('en'),
    AppLocale.fr => const Locale('fr'),
  },
);

/// The theme the app is actually wearing: the player's choice once there is one, the platform's
/// own brightness until then.
///
/// The fallback lives here and nowhere else. Both the palette below and the settings screen's
/// selected row are answers to the same question, and a screen that resolved it a second time
/// could tell the player they had chosen nothing while the app was visibly dark.
final Provider<AppTheme> _activeThemeProvider = Provider<AppTheme>(
  (ref) =>
      ref.watch(storedThemeProvider) ??
      switch (ref.watch(_platformBrightnessProvider)) {
        Brightness.dark => AppTheme.dark,
        Brightness.light => AppTheme.light,
      },
);

/// The first language the device asks for that the app actually ships, English otherwise.
final Provider<AppLocale> _deviceLocaleProvider = Provider<AppLocale>((ref) {
  for (final Locale locale in WidgetsBinding.instance.platformDispatcher.locales) {
    if (locale.languageCode == 'fr') return AppLocale.fr;
    if (locale.languageCode == 'en') return AppLocale.en;
  }

  return AppLocale.en;
});

/// Mapping an `AppTheme` to an `AppPalette` happens here and nowhere else, which is what lets a
/// theme be stored without the storage layer ever seeing a `Color`.
final Provider<AppPalette> _paletteProvider = Provider<AppPalette>(
  (ref) => switch (ref.watch(_activeThemeProvider)) {
    AppTheme.dark => AppPalette.dark(),
    AppTheme.light => AppPalette.light(),
    AppTheme.matrix => AppPalette.matrix(),
  },
);

/// Where the board's player comes from — composition's decision, which is the whole reason the
/// board takes it as a contract rather than reading storage itself.
///
/// The fallback is unreachable in practice: the sheet gates the board and cannot be dismissed
/// without naming somebody. It exists so the type stays non-null rather than pushing an
/// impossible case into every widget that shows a name.
final Provider<Player> _playerProvider = Provider<Player>(
  (ref) => ref.watch(storedPlayerProvider) ?? Player.create(_fallbackPlayerName).getOrThrow(),
);

/// Nothing is persisted, so on a cold start there is no stored preference to read: the app
/// opens in the platform's own light or dark. The splash is specified to be system light or
/// dark and never matrix, which is exactly this.
final Provider<Brightness> _platformBrightnessProvider = Provider<Brightness>(
  (ref) => WidgetsBinding.instance.platformDispatcher.platformBrightness,
);

/// The name nobody sees. `getOrThrow` rather than a force-unwrap: the only way a literal can fail
/// `Player.create` is by being empty, so a throw here would be a programming error — which is the
/// one thing this codebase throws for.
const String _fallbackPlayerName = 'Player';

/// The board stays visible behind the sheet at 18% of itself, so the barrier covers the rest.
const double _setupBarrierOpacity = 0.82;

/// Matrix swaps the sans styles for the platform monospace, so the type follows the theme too.
final Provider<AppTypography> _typographyProvider = Provider<AppTypography>(
  (ref) => AppTypography.system(monospace: ref.watch(_activeThemeProvider) == AppTheme.matrix),
);
