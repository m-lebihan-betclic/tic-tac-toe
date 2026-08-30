import 'package:app_router/src/app_router.br.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:splash_presentation/splash_presentation.dart';

/// Composition's answer to the splash feature's port. The feature says *what happened*; this
/// class is the only place that knows *where that leads*.
final class AppSplashRouting implements SplashRouting {
  final AppRouter _router;

  const AppSplashRouting({required AppRouter router}) : _router = router;

  /// `replace`, not `push`: the splash is a brand beat, and a back gesture that returns to it
  /// would be returning to something that has already finished. The setup sheet is presented
  /// over the board rather than routed to, so it does not appear here.
  @override
  void onSplashCompleted() => _router.replace(const GameRoute());
}
