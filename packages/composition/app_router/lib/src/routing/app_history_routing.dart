import 'package:app_router/src/app_router.br.dart';
import 'package:history_presentation/history_presentation.dart';

/// Composition's answer to the history screen's port.
final class AppHistoryRouting implements HistoryRouting {
  final AppRouter _router;

  const AppHistoryRouting({required AppRouter router}) : _router = router;

  @override
  void onDismissHistory() => _router.maybePop();
}
