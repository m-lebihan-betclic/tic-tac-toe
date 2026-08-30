import 'package:app_router/src/app_router.br.dart';
import 'package:flutter/material.dart';
import 'package:setup_presentation/setup_presentation.dart';

/// Composition's answer to the setup sheet's port.
///
/// The sheet says it is done; this decides that means dismissing it.
final class AppSetupRouting implements SetupRouting {
  final AppRouter _router;

  const AppSetupRouting({required AppRouter router}) : _router = router;

  /// Dismiss, and nothing else. The store notifies, so the board picks up the name and the level
  /// on its own — there is no restart to orchestrate from out here.
  @override
  void onSetupCompleted() => _router.navigatorKey.currentState?.pop();
}

/// Presents the sheet over the board: non-dismissible, no drag, and the board left visible behind
/// it. There is no route for it, because it is not a destination — it is a gate in front of one.
///
/// Non-dismissible is safe precisely because this is the cold start and nothing else: the sheet
/// gates a board nobody has been named for, so there is nothing behind it to go back to. Changing
/// a name later happens in settings, in the row that shows it.
void presentSetupSheet(AppRouter router, Color barrierColor) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final BuildContext? context = router.navigatorKey.currentContext;
    if (context == null) return;

    showModalBottomSheet<void>(
      backgroundColor: const Color(0x00000000),
      barrierColor: barrierColor,
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      builder: (_) => const SetupScreen(),
    );
  });
}
