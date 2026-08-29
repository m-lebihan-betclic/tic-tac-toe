import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splash_presentation/src/providers_internal.br.dart';
import 'package:splash_presentation/src/routing/splash_routing.dart';
import 'package:splash_presentation/src/theme/splash_theme.br.dart';

part 'providers_di.br.g.dart';

/// Required: throws until composition feeds it.
@riverpod
SplashRouting splashRouting(Ref _) {
  throw UnregisteredProviderException(splashRoutingProvider);
}

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.
@riverpod
SplashTheme splashTheme(Ref ref) => ref.watch(defaultSplashThemeProvider);
