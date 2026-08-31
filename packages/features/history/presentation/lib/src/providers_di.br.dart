import 'package:exceptions/exceptions.dart';
import 'package:history_presentation/src/providers_internal.br.dart';
import 'package:history_presentation/src/routing/history_routing.dart';
import 'package:history_presentation/src/theme/history_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

/// Required: throws until composition feeds it.
@riverpod
HistoryRouting historyRouting(Ref _) {
  throw UnregisteredProviderException(historyRoutingProvider);
}

/// Optional: proxies the in-package default, so the feature renders with or without one.
@riverpod
HistoryTheme historyTheme(Ref ref) => ref.watch(defaultHistoryThemeProvider);
