import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_presentation/src/settings_screen.dart';

part 'settings_router.br.gr.dart';

/// This feature's sub-paths, alphabetically sorted. Top-level paths belong to composition's
/// own `RoutePath`.
enum SettingsRoutePath {
  settings(path: 'settings');

  final String path;

  const SettingsRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class SettingsRouter extends RootStackRouter {}

@RoutePage(name: 'SettingsRoute')
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const SettingsScreen();
}
