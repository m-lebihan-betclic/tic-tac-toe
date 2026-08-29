import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splash_presentation/src/splash_screen.dart';

part 'splash_router.br.gr.dart';

/// This feature's sub-paths, alphabetically sorted. Top-level paths belong to composition's
/// own `RoutePath`.
enum SplashRoutePath {
  splash(path: 'splash');

  final String path;

  const SplashRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class SplashRouter extends RootStackRouter {}

@RoutePage(name: 'SplashRoute')
class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const SplashScreen();
}
