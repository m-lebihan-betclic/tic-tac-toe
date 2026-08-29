import 'package:app_router/src/app_router.br.dart';
import 'package:splash_presentation/splash_presentation.dart';

/// Composition's answer to the splash feature's port. The feature says *what happened*; this
/// class is the only place that knows *where that leads*.
final class AppSplashRouting implements SplashRouting {
  // ignore: unused_field — held for onSplashCompleted, which lands with the board (step 6).
  final AppRouter _router;

  const AppSplashRouting({required AppRouter router}) : _router = router;

  /// Where the splash leads once the board and the setup sheet exist (BUILD.md steps 6 and 8):
  /// `_router.replace(const GameRoute())`, with the setup sheet presented over it. Until then
  /// there is no destination to name, so the splash holds — deliberately, and in one obvious
  /// place rather than as a missing method somewhere in the feature.
  @override
  void onSplashCompleted() {}
}
