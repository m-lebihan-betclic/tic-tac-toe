import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:setup_presentation/src/setup_screen.dart';

part 'setup_router.br.gr.dart';

/// This feature's sub-paths, alphabetically sorted. Top-level paths belong to composition's
/// own `RoutePath`.
enum SetupRoutePath {
  setup(path: 'setup');

  final String path;

  const SetupRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class SetupRouter extends RootStackRouter {}

@RoutePage(name: 'SetupRoute')
class SetupPage extends ConsumerWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const SetupScreen();
}
