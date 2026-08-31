import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:history_presentation/src/history_screen.dart';

part 'history_router.br.gr.dart';

/// This feature's sub-paths, alphabetically sorted. Top-level paths belong to composition's
/// own `RoutePath`.
enum HistoryRoutePath {
  history(path: 'history');

  final String path;

  const HistoryRoutePath({required this.path});
}

@AutoRouterConfig()
abstract class HistoryRouter extends RootStackRouter {}

@RoutePage(name: 'HistoryRoute')
class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const HistoryScreen();
}
