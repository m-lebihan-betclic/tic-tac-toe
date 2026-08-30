import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';
import 'package:settings_presentation/src/providers_internal.br.dart';
import 'package:settings_presentation/src/routing/settings_routing.dart';
import 'package:settings_presentation/src/theme/settings_theme.br.dart';

part 'providers_di.br.g.dart';

/// Required. The language actually in force, which is not the same as the stored one: nothing is
/// stored until somebody picks, and until then the device decides.
///
/// The screen has to render a selection either way, and narrowing a device locale to the two the
/// app ships is composition's rule — it is the same resolution `MaterialApp` is given. Reading it
/// as a contract keeps that rule in one place instead of two that can disagree.
@riverpod
AppLocale activeLocale(Ref _) {
  throw UnregisteredProviderException(activeLocaleProvider);
}

/// Required, and for the same reason as [activeLocale]: on a cold start no theme is stored and
/// the app is wearing the platform's own. A settings screen showing three unselected rows while
/// the app is visibly dark would be reporting storage, not reality.
@riverpod
AppTheme activeTheme(Ref _) {
  throw UnregisteredProviderException(activeThemeProvider);
}

/// Required. Who is playing is a session fact, and the same one the board reads — composition
/// answers both from one place rather than each screen deciding what an unnamed player means.
@riverpod
Player player(Ref _) {
  throw UnregisteredProviderException(playerProvider);
}

/// Required: throws until composition feeds it.
@riverpod
SettingsRouting settingsRouting(Ref _) {
  throw UnregisteredProviderException(settingsRoutingProvider);
}

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.
@riverpod
SettingsTheme settingsTheme(Ref ref) => ref.watch(defaultSettingsThemeProvider);

/// Required. The app's own version, as the build stamped it into the bundle. A feature has no
/// business making a platform call, and a constant here would be a second copy of a number that
/// is declared in the app's `pubspec.yaml`.
@riverpod
String version(Ref _) {
  throw UnregisteredProviderException(versionProvider);
}
