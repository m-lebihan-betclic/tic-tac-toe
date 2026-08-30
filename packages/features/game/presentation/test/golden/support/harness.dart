import 'dart:math';

import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/game_screen.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;

/// A palette and the type scale that ships with it — matrix swaps the sans styles for the
/// platform monospace, and a screen golden that ignored that would pin a layout the app never
/// produces.
typedef GoldenTheme = ({String name, AppPalette palette, AppTypography typography});

List<GoldenTheme> goldenThemes() => <GoldenTheme>[
  (name: 'dark', palette: AppPalette.dark(), typography: AppTypography.system()),
  (name: 'light', palette: AppPalette.light(), typography: AppTypography.system()),
  (
    name: 'matrix',
    palette: AppPalette.matrix(),
    typography: AppTypography.system(monospace: true),
  ),
];

/// Both widths, always. The design is drawn at 390 and the board's columns *fill*, so 320 is what
/// fails the moment a width is hardcoded — which is the whole reason these run at two sizes
/// rather than at three themes and one.
const Map<String, Size> goldenSizes = <String, Size>{
  '320': Size(320, 780),
  '390': Size(390, 780),
};

/// Nothing is stored, which is the state a cold start is in.
final class _EmptyPreferences implements PreferencesRepository {
  const _EmptyPreferences();

  @override
  Difficulty? readDifficulty() => null;

  @override
  AppLocale? readLocale() => null;

  @override
  AppTheme? readTheme() => null;

  @override
  void writeDifficulty(Difficulty difficulty) {}

  @override
  void writeLocale(AppLocale locale) {}

  @override
  void writeTheme(AppTheme theme) {}
}

final class _NoopRouting implements game_presentation.GameRouting {
  const _NoopRouting();

  @override
  void onHistoryRequested() {}

  @override
  void onSettingsRequested() {}
}

/// The board, wired the way composition wires it.
///
/// [cpuSeed] makes the easy CPU's reply repeatable. It plays a random free slot, so any capture
/// that lets the CPU move is a different picture every run without one.
ProviderContainer boardContainer({required GoldenTheme theme, int cpuSeed = 7}) => ProviderContainer(
  overrides: <Override>[
    cpuRandomProvider.overrideWith((ref) => Random(cpuSeed)),
    ...design_providers.bindProviders(
      palette: Provider<AppPalette>((ref) => theme.palette),
      typography: Provider<AppTypography>((ref) => theme.typography),
    ),
    ...session_domain.bindProviders(
      preferences: Provider<PreferencesRepository>((ref) => const _EmptyPreferences()),
    ),
    ...game_presentation.bindProviders(
      player: Provider<Player>((ref) => Player.create('Morgan').getOrThrow()),
      routing: (ref) => const _NoopRouting(),
    ),
  ],
);

/// Pumps the whole screen at [size], under [theme].
Future<void> pumpBoard(
  WidgetTester tester, {
  required ProviderContainer container,
  required GoldenTheme theme,
  Size size = const Size(390, 780),
}) async {
  addTearDown(container.dispose);
  tester.view
    ..devicePixelRatio = 1
    ..physicalSize = size;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const RepaintBoundary(key: Key('golden'), child: GameScreen()),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          extensions: <ThemeExtension<dynamic>>[theme.palette, theme.typography],
          useMaterial3: true,
        ),
      ),
    ),
  );
  // One frame, never `pumpAndSettle`: the turn dot blinks on the CPU's turn and would never let
  // a settle return.
  await tester.pump();
}
