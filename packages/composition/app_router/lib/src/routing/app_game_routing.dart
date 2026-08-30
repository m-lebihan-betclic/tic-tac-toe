import 'package:app_router/src/app_router.br.dart';
import 'package:game_presentation/game_presentation.dart';

/// Composition's answer to the board's port. The feature says *what happened*; this class is the
/// only place that knows *where that leads* — which is what lets the board open Settings without
/// knowing Settings exists.
final class AppGameRouting implements GameRouting {
  // ignore: unused_field — held for the two destinations, which land with steps 9 and 10.
  final AppRouter _router;

  const AppGameRouting({required AppRouter router}) : _router = router;

  /// Session history is BUILD.md step 10. Until that route exists there is nowhere to send this,
  /// and the gap is one empty method in the layer whose job is knowing where things lead.
  @override
  void onHistoryRequested() {}

  /// Settings is BUILD.md step 9, and the same applies.
  @override
  void onSettingsRequested() {}
}
