import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/harness.dart';

/// The four components settings is the first caller of, in one card and one control each.
///
/// They are captured together rather than one file per component because they are only ever seen
/// together: a radio's 6px ring is right or wrong relative to the row it sits in, and a card whose
/// dividers land at the wrong height is invisible in isolation.
void main() {
  for (final GoldenTheme theme in goldenThemes()) {
    testWidgets('card, rows, radio and segments in ${theme.name}', (tester) async {
      await pumpComponent(
        tester,
        theme: theme,
        // Taller than the default surface: two cards and a control do not fit a component-sized
        // box, and the alternative is three captures that never show a divider between rows.
        size: const Size(320, 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.spacing400,
          children: <Widget>[
            AppCard(
              children: <Widget>[
                // Unselected above selected, so one capture carries both weights and both rings
                // as well as the divider between them.
                AppCardRow(label: 'Light', onPressed: () {}, trailing: const AppRadio(selected: false)),
                AppCardRow(
                  emphasized: true,
                  label: 'Dark',
                  onPressed: () {},
                  trailing: const AppRadio(selected: true),
                ),
              ],
            ),
            AppSegmentedControl<int>(
              onSelected: (_) {},
              segments: const <AppSegment<int>>[
                AppSegment<int>(label: 'Easy', value: 0),
                AppSegment<int>(label: 'Hard', value: 1),
              ],
              selected: 0,
            ),
          ],
        ),
      );

      await expectLater(
        find.byKey(const Key('golden')),
        matchesGoldenFile('goldens/settings_components_${theme.name}.png'),
      );
    });
  }
}
