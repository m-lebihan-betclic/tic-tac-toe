import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:setup_presentation/src/providers_internal.br.dart';
import 'package:setup_presentation/src/routing/setup_routing.dart';
import 'package:setup_presentation/src/theme/setup_theme.br.dart';

part 'providers_di.br.g.dart';

/// Required: throws until composition feeds it.
@riverpod
SetupRouting setupRouting(Ref _) {
  throw UnregisteredProviderException(setupRoutingProvider);
}

/// Optional: proxies the in-package default, so the feature renders with or without one.
@riverpod
SetupTheme setupTheme(Ref ref) => ref.watch(defaultSetupThemeProvider);
