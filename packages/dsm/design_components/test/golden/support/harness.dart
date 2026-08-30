import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// A palette and the type scale that ships with it.
///
/// The two travel together because composition pairs them: matrix swaps the sans styles for the
/// platform monospace, so a golden that ran the matrix palette against the sans scale would pin a
/// rendering the app never produces — and would go on passing while real matrix text reflowed.
typedef GoldenTheme = ({String name, AppPalette palette, AppTypography typography});

/// The three themes every component golden runs against.
List<GoldenTheme> goldenThemes() => <GoldenTheme>[
  (name: 'dark', palette: AppPalette.dark(), typography: AppTypography.system()),
  (name: 'light', palette: AppPalette.light(), typography: AppTypography.system()),
  (
    name: 'matrix',
    palette: AppPalette.matrix(),
    typography: AppTypography.system(monospace: true),
  ),
];

/// Pumps [child] inside a `MaterialApp` carrying the palette and the type scale as `ThemeData`
/// extensions, sized to the component rather than to a phone.
///
/// One `pumpWidget` and nothing else is the point of components being plain widgets: no
/// `ProviderScope`, no overrides, no feature theme to bind.
Future<void> pumpComponent(
  WidgetTester tester, {
  required Widget child,
  required GoldenTheme theme,
  Size size = const Size(320, 260),

  /// False for anything that animates forever — `pumpAndSettle` waits for a tree that goes quiet,
  /// and the blinking dots never do.
  bool settle = true,
}) async {
  tester.view
    ..devicePixelRatio = 1
    ..physicalSize = size;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // Material, because a component is never rendered without one in the app — every screen is
      // a Scaffold. Without it every Text merges onto MaterialApp's fallback style and the
      // goldens bake in a monospace family and a yellow double underline that no screen shows.
      home: Material(
        color: theme.palette.background,
        child: RepaintBoundary(
          key: const Key('golden'),
          child: ColoredBox(
            color: theme.palette.background,
            child: Padding(padding: const EdgeInsets.all(AppSpacing.gutter), child: child),
          ),
        ),
      ),
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[theme.palette, theme.typography],
        useMaterial3: true,
      ),
    ),
  );
  settle ? await tester.pumpAndSettle() : await tester.pump();
}
