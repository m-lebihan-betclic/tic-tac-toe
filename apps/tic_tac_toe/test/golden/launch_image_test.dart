import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Renders the native launch screens' mark, and writes it where the platforms read it.
///
/// The launch image is not decoration: it is the first half of one continuous beat, and the
/// splash draws the second half. Rendering it from the same widget the splash uses is what keeps
/// the two identical — a hand-exported asset drifts the first time a palette moves, and the only
/// symptom is a mark that changes colour a third of a second into a cold start.
///
/// So this is a generator and a test at once. `mise run goldens-update` writes the assets the
/// app ships; `mise run goldens` fails if the mark and the shipped image have parted company.
///
/// The mark is centred on the screen on both sides of the handover — see `SplashScreen`, which
/// centres it on the screen rather than on the lockup it heads, for the reason.
void main() {
  const Map<String, double> scales = <String, double>{'': 1, '@2x': 2, '@3x': 3};
  final Map<String, AppPalette> palettes = <String, AppPalette>{
    '': AppPalette.light(),
    'Dark': AppPalette.dark(),
  };

  /// [scale] is a pixel multiplier, applied to the *logical* size rather than to the view's
  /// density: `matchesGoldenFile` captures a boundary at its logical size and ignores
  /// `devicePixelRatio` entirely, so asking for a 3x view yields a 74px file. The mark is vector
  /// under the scale, so it re-rasterises rather than enlarging.
  Future<void> render(WidgetTester tester, AppPalette palette, double scale, String path) async {
    final double side = AppSizing.markSplash * scale;
    tester.view
      ..devicePixelRatio = 1
      ..physicalSize = Size.square(side);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      RepaintBoundary(
        key: const Key('mark'),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox.square(
            dimension: side,
            child: ColoredBox(
              // Opaque, not transparent: iOS composites the launch image over the storyboard's
              // background and Android over the window's, and a mark with soft edges over a
              // near-black ground shows a halo if the two grounds disagree by a shade.
              color: palette.background,
              child: FittedBox(
                child: NineSquareMark.splash(
                  cpuColor: palette.markCpu,
                  outlineColor: palette.outline,
                  playerColor: palette.markPlayer,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(find.byKey(const Key('mark')), matchesGoldenFile(path));
  }

  for (final MapEntry<String, AppPalette> palette in palettes.entries) {
    for (final MapEntry<String, double> scale in scales.entries) {
      testWidgets('the iOS launch mark, ${palette.key.isEmpty ? 'light' : 'dark'}${scale.key}', (
        tester,
      ) async {
        await render(
          tester,
          palette.value,
          scale.value,
          '../../ios/Runner/Assets.xcassets/LaunchImage.imageset/LaunchImage${palette.key}${scale.key}.png',
        );
      });
    }

    testWidgets('the Android launch mark, ${palette.key.isEmpty ? 'light' : 'dark'}', (
      tester,
    ) async {
      // One density, at 4x. Android scales a xxxhdpi drawable down for every bucket below it,
      // and a launch image is on screen for half a second — five hand-kept copies of the same
      // square is a maintenance surface bought with nothing.
      await render(
        tester,
        palette.value,
        4,
        '../../android/app/src/main/res/drawable${palette.key.isEmpty ? '' : '-night'}-xxxhdpi/launch_mark.png',
      );
    });
  }
}
