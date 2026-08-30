import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// The three themes every component golden runs against.
const Map<String, AppPalette Function()> palettes = <String, AppPalette Function()>{
  'light': AppPalette.light,
  'dark': AppPalette.dark,
  'matrix': AppPalette.matrix,
};

/// Pumps [child] inside a `MaterialApp` carrying the palette and the type scale as `ThemeData`
/// extensions, sized to the component rather than to a phone.
///
/// One `pumpWidget` and nothing else is the point of components being plain widgets: no
/// `ProviderScope`, no overrides, no feature theme to bind.
Future<void> pumpComponent(
  WidgetTester tester, {
  required AppPalette palette,
  required Widget child,
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
        color: palette.background,
        child: RepaintBoundary(
          key: const Key('golden'),
          child: ColoredBox(
            color: palette.background,
            child: Padding(padding: const EdgeInsets.all(AppSpacing.gutter), child: child),
          ),
        ),
      ),
      theme: ThemeData(
        extensions: <ThemeExtension<dynamic>>[palette, AppTypography.system()],
        useMaterial3: true,
      ),
    ),
  );
  settle ? await tester.pumpAndSettle() : await tester.pump();
}
