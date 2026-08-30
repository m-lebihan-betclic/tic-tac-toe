import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:design_providers/design_providers.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';

/// [version] comes from the bundle, which the build stamped from `version:` in this app's
/// `pubspec.yaml`. It arrives as an argument rather than being read here because reading it is a
/// platform call, and composition is where the app's own facts are resolved.
Widget buildApplication({required String version}) => ProviderScope(
  overrides: appProviders(version: version),
  child: const _Application(),
);

class _Application extends ConsumerWidget {
  const _Application();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(appPaletteProvider);
    final typography = ref.watch(appTypographyProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // Always explicit, never null: composition resolves the device's own language down to the
      // two the app ships, and settings renders that same answer as a selected segment. Leaving
      // this null would let Flutter resolve one language while the screen reported another.
      locale: ref.watch(localeProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.l10n.appTitle,
      routerConfig: ref.watch(appRouterProvider).config(),
      supportedLocales: AppLocalizations.supportedLocales,
      // The 200ms `themeSwitch` in the spec is this, plus AppPalette.lerp: MaterialApp animates
      // its ThemeData, so switching theme fades the whole tree instead of cutting.
      themeAnimationDuration: AppMotion.themeSwitch,
      // Material is only ever the host: it carries the two extensions and settles nothing else.
      // Every colour, size and type style a screen uses comes from these extensions or from a
      // feature theme built out of them — never from `colorScheme`, and never from `ThemeData`.
      //
      // That is why there is no `scaffoldBackgroundColor`. Each screen's Scaffold takes its
      // background from its own feature theme, which is the seam composition overrides through
      // `bindProviders`; a theme-level default would quietly paint screens that never asked, and
      // one that forgets is better off looking obviously wrong than looking right by accident.
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[palette, typography],
        useMaterial3: true,
      ),
    );
  }
}
