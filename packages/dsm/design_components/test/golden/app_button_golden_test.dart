import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

void main() {
  for (final GoldenTheme theme in goldenThemes()) {
    testWidgets('button states in ${theme.name}', (tester) async {
      await pumpComponent(
        tester,
        theme: theme,
        // Four 52px buttons and three gaps, inside the gutter: 320 is the shortest canvas that
        // holds them without the column overflowing.
        size: const Size(320, 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.spacing400,
          children: <Widget>[
            AppButton.primary(label: 'Start playing', onPressed: () {}),
            const AppButton.primary(label: 'Start playing', onPressed: null),
            AppButton.secondary(label: 'Reset game', onPressed: () {}),
            const AppButton.secondary(label: 'Reset game', onPressed: null),
          ],
        ),
      );

      await expectLater(
        find.byKey(const Key('golden')),
        matchesGoldenFile('goldens/app_button_${theme.name}.png'),
      );
    });

    testWidgets('button pressed in ${theme.name}', (tester) async {
      await pumpComponent(
        tester,
        theme: theme,
        size: const Size(320, 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.spacing400,
          children: <Widget>[
            AppButton.primary(label: 'Start playing', onPressed: () {}),
            AppButton.secondary(label: 'Reset game', onPressed: () {}),
          ],
        ),
      );

      // Two fingers down at once, so both variants show their pressed fill in one capture.
      final List<TestGesture> gestures = <TestGesture>[
        await tester.startGesture(tester.getCenter(find.byType(AppButton).first)),
        await tester.startGesture(tester.getCenter(find.byType(AppButton).last)),
      ];
      addTearDown(() async {
        for (final TestGesture gesture in gestures) {
          await gesture.up();
        }
      });
      // Let the 90ms fill shift finish, or the capture lands mid-animation and flakes.
      await tester.pump();
      await tester.pump(AppMotion.press);

      await expectLater(
        find.byKey(const Key('golden')),
        matchesGoldenFile('goldens/app_button_pressed_${theme.name}.png'),
      );
    });
  }
}
