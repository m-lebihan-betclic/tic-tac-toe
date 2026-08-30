import 'package:app_router/src/app_router.br.dart';
import 'package:settings_presentation/settings_presentation.dart';

/// Composition's answer to the settings screen's port.
///
/// One method, because the screen answers everything else itself: the nickname is edited in place,
/// so the only thing left that it cannot know is what is behind it.
final class AppSettingsRouting implements SettingsRouting {
  final AppRouter _router;

  const AppSettingsRouting({required AppRouter router}) : _router = router;

  @override
  void onDismissSettings() => _router.maybePop();
}
