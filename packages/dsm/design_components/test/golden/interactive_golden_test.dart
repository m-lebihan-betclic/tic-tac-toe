import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

/// The three components the other files leave uncovered: the chip, the icon button and the
/// status dot.
///
/// The chip is captured in all four of its shapes at once — selected and not, with a swatch and
/// without — because the swatch's inset is what keeps a near-black square legible on a dark chip
/// and a near-white one legible on a light chip, and that only reads next to its opposite.
void main() {
  for (final GoldenTheme theme in goldenThemes()) {
    testWidgets('chips, icon buttons and dots in ${theme.name}', (tester) async {
      await pumpComponent(
        tester,
        // The dot blinks forever on the CPU's turn, so this never settles: one frame, and the
        // capture lands on the animation's first tick every time.
        settle: false,
        size: const Size(360, 260),
        theme: theme,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.spacing400,
          children: <Widget>[
            Row(
              spacing: AppSpacing.spacing200,
              children: <Widget>[
                Expanded(
                  child: AppChip(label: 'Easy', onPressed: () {}, selected: true),
                ),
                Expanded(
                  child: AppChip(label: 'Hard', onPressed: () {}, selected: false),
                ),
              ],
            ),
            Row(
              spacing: AppSpacing.spacing200,
              children: <Widget>[
                Expanded(
                  child: AppChip(
                    label: 'Light',
                    onPressed: () {},
                    selected: false,
                    swatch: AppPalette.light().background,
                    swatchBorder: AppPalette.light().onSurface.withValues(alpha: 0.22),
                  ),
                ),
                Expanded(
                  child: AppChip(
                    label: 'Matrix',
                    onPressed: () {},
                    selected: true,
                    swatch: AppPalette.matrix().background,
                    swatchBorder: AppPalette.matrix().markPlayer,
                    swatchGlow: AppPalette.matrix().markPlayer,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSpacing.spacing400,
              children: <Widget>[
                AppIconButton(
                  // A ring, the way the board's settings button draws one. `SizedBox.expand` is
                  // load-bearing: the button centres its glyph, so a bare `DecoratedBox` would
                  // take the smallest size the loose constraints allow and paint nothing at all.
                  glyph: SizedBox.expand(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.palette.onSurface, width: 2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  semanticLabel: 'Settings',
                ),
                StatusDot(color: theme.palette.primary),
                StatusDot(blinking: true, color: theme.palette.markCpu),
              ],
            ),
          ],
        ),
      );

      await expectLater(
        find.byKey(const Key('golden')),
        matchesGoldenFile('goldens/interactive_${theme.name}.png'),
      );
    });
  }
}
