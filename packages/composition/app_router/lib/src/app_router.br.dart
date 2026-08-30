import 'package:auto_route/auto_route.dart';
import 'package:game_presentation/game_presentation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:settings_presentation/settings_presentation.dart';
import 'package:splash_presentation/splash_presentation.dart';

part 'app_router.br.g.dart';
part 'app_router.br.gr.dart';

/// Top-level paths. Sub-paths belong to the `{Feature}RoutePath` enum colocated in each
/// feature's router — there is deliberately no central catalogue of every path in the app.
enum RoutePath {
  game(path: '/game'),
  settings(path: '/settings'),
  splash(path: '/');

  final String path;

  const RoutePath({required this.path});
}

@Riverpod(keepAlive: true)
AppRouter appRouter(Ref _) => AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(initial: true, page: SplashRoute.page, path: RoutePath.splash.path),
    AutoRoute(page: GameRoute.page, path: RoutePath.game.path),
    AutoRoute(page: SettingsRoute.page, path: RoutePath.settings.path),
  ];
}
