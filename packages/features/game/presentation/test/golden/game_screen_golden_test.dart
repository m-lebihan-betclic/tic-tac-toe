import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

/// §03 — the board on the player's turn, in three themes at two widths.
///
/// Six captures of one state, not one capture of six states: the components already pin what a
/// cell, a button and a stat look like, so what is left for a screen golden is composition —
/// the gutters, the anchored footer, and whether the board still fills its column.
///
/// The second width is the point. The design is drawn at 390 and the grid's columns *fill*, so
/// every pinned pixel in the spec is what a fraction resolved to at the reference viewport. A
/// constraint-driven screen passes both; the moment a width is hardcoded, 320 overflows and the
/// build fails. That is what makes the layout rules enforceable rather than aspirational.
void main() {
  for (final GoldenTheme theme in goldenThemes()) {
    for (final MapEntry<String, Size> size in goldenSizes.entries) {
      testWidgets("the player's turn in ${theme.name} at ${size.key}", (tester) async {
        await pumpBoard(
          tester,
          container: boardContainer(theme: theme),
          size: size.value,
          theme: theme,
        );

        await expectLater(
          find.byKey(const Key('golden')),
          matchesGoldenFile('goldens/game_screen_${size.key}_${theme.name}.png'),
        );
      });
    }
  }
}
