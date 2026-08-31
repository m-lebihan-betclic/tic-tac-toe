import 'package:app_router/src/app_router.br.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:history_presentation/history_presentation.dart';
import 'package:settings_presentation/settings_presentation.dart';

/// Composition's answer to the board's port. The feature says *what happened*; this class is the
/// only place that knows *where that leads* — which is what lets the board open Settings without
/// knowing Settings exists.
final class AppGameRouting implements GameRouting {
  final AppRouter _router;

  const AppGameRouting({required AppRouter router}) : _router = router;

  /// Pushed, like settings: the round behind it is still live, and its state is in a provider, so
  /// the board comes back exactly as it was left.
  @override
  void onHistoryRequested() => _router.push(const HistoryRoute());

  /// Pushed rather than replacing the board: settings is a detour, and the round behind it is
  /// still live. Its state is in a provider, so the board comes back exactly as it was left.
  @override
  void onSettingsRequested() => _router.push(const SettingsRoute());
}
