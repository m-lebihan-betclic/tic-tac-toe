import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';
import 'package:settings_presentation/src/providers_di.br.dart';
import 'package:settings_presentation/src/routing/settings_routing.dart';
import 'package:settings_presentation/src/theme/settings_theme.br.dart';

// Five required contracts and one optional theme. The theme and the locale are what is *in force*
// rather than what is stored, because that distinction is composition's to resolve and this
// screen's to render; the version is a fact about the binary, which is the same kind of thing.
//
// Nothing here mentions a repository. The screen writes the theme, the level and the language
// through `session_domain`'s behaviour providers, and the implementation behind them is
// composition's business — which is what lets this feature and the setup sheet write the same
// session without either knowing where it is kept.
List<Override> bindProviders({
  required ProviderListenable<AppLocale> locale,
  required ProviderListenable<Player> player,
  required SettingsRouting Function(Ref ref) routing,
  required ProviderListenable<AppTheme> theme,
  required ProviderListenable<String> version,
  ProviderListenable<SettingsTheme>? settingsTheme,
}) => <Override>[
  activeLocaleProvider.overrideWith((ref) => ref.watch(locale)),
  activeThemeProvider.overrideWith((ref) => ref.watch(theme)),
  playerProvider.overrideWith((ref) => ref.watch(player)),
  settingsRoutingProvider.overrideWith(routing),
  versionProvider.overrideWith((ref) => ref.watch(version)),
  if (settingsTheme != null) settingsThemeProvider.overrideWith((ref) => ref.watch(settingsTheme)),
];
