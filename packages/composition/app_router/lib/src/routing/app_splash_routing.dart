import 'package:app_router/src/app_router.br.dart';
import 'package:app_router/src/routing/app_setup_routing.dart';
import 'package:flutter/widgets.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:splash_presentation/splash_presentation.dart';

/// Composition's answer to the splash feature's port. The feature says *what happened*; this
/// class is the only place that knows *where that leads*.
final class AppSplashRouting implements SplashRouting {
  /// The board behind the sheet, dimmed to 18% of itself.
  final Color _setupBarrierColor;

  final AppRouter _router;

  const AppSplashRouting({required AppRouter router, required Color setupBarrierColor})
    : _router = router,
      _setupBarrierColor = setupBarrierColor;

  /// `replace`, not `push`: the splash is a brand beat, and a back gesture that returns to it
  /// would be returning to something that has already finished. The setup sheet is presented
  /// over the board rather than routed to, so it does not appear here.
  @override
  void onSplashCompleted() {
    _router.replace(const GameRoute());
    // Nothing is persisted, so a cold start never has a player: the sheet is always the next
    // thing after the splash, and it gates the board rather than replacing it.
    presentSetupSheet(_router, _setupBarrierColor);
  }
}
