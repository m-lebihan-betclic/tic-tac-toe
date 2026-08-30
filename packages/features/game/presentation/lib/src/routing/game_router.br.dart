import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_presentation/src/game_screen.dart';

part 'game_router.br.gr.dart';

/// This feature's sub-paths, alphabetically sorted. Top-level paths belong to composition's
/// own `RoutePath`.
enum GameRoutePath {
  game(path: 'game');

  final String path;

  const GameRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class GameRouter extends RootStackRouter {}

@RoutePage(name: 'GameRoute')
class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const GameScreen();
}
