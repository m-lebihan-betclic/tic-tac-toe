import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

void main() {
  for (final MapEntry<String, AppPalette Function()> palette in palettes.entries) {
    testWidgets('mark, stats and separators in ${palette.key}', (tester) async {
      final AppPalette resolved = palette.value();

      await pumpComponent(
        tester,
        palette: resolved,
        settle: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.spacing400,
          children: <Widget>[
            NineSquareMark.appBar(
              cpuColor: resolved.markCpu,
              outlineColor: resolved.outline,
              playerColor: resolved.markPlayer,
            ),
            const AppSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const AppStat(label: 'WON', value: '3'),
                AppStat(label: 'DRAWN', value: '1', accent: resolved.success),
                // A zero is muted: nothing has happened yet.
                const AppStat(label: 'LOST', value: '0'),
              ],
            ),
            const AppSeparator.fullBleed(),
            BlinkingDots(color: resolved.onSurfaceMuted),
          ],
        ),
      );
      await expectLater(
        find.byKey(const Key('golden')),
        matchesGoldenFile('goldens/components_${palette.key}.png'),
      );
    });
  }
}
