import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

void main() {
  for (final GoldenTheme theme in goldenThemes()) {
    testWidgets('mark, stats and separators in ${theme.name}', (tester) async {
      await pumpComponent(
        tester,
        theme: theme,
        settle: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.spacing400,
          children: <Widget>[
            NineSquareMark.appBar(
              cpuColor: theme.palette.markCpu,
              outlineColor: theme.palette.outline,
              playerColor: theme.palette.markPlayer,
            ),
            const AppSeparator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const AppStat(label: 'WON', value: '3'),
                AppStat(label: 'DRAWN', value: '1', accent: theme.palette.success),
                // A zero is muted: nothing has happened yet.
                const AppStat(label: 'LOST', value: '0'),
              ],
            ),
            const AppSeparator.fullBleed(),
            BlinkingDots(color: theme.palette.onSurfaceMuted),
          ],
        ),
      );
      await expectLater(
        find.byKey(const Key('golden')),
        matchesGoldenFile('goldens/components_${theme.name}.png'),
      );
    });
  }
}
