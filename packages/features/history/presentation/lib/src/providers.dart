import 'package:history_presentation/src/providers_di.br.dart';
import 'package:history_presentation/src/routing/history_routing.dart';
import 'package:history_presentation/src/theme/history_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Routing is required — its contract throws until fed. The theme is optional: without it the
// feature renders with its own internal default.
//
// Nothing else. This screen reads the session's finished rounds through `session_domain` and
// writes nothing at all, which is why it needs no player, no theme in force and no version: it
// is the one feature here that is purely a reader.
List<Override> bindProviders({
  required HistoryRouting Function(Ref ref) routing,
  ProviderListenable<HistoryTheme>? theme,
}) => <Override>[
  historyRoutingProvider.overrideWith(routing),
  if (theme != null) historyThemeProvider.overrideWith((ref) => ref.watch(theme)),
];
