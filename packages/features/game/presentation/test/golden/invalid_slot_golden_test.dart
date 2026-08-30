import 'package:design_tokens/design_tokens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/widgets/game_board.dart';

import 'support/harness.dart';

/// The invalid ring, on a corner cell and on the centre one.
///
/// It is pinned because it has been wrong twice. The ring is the cell's own outline, so on a
/// corner cell it has to follow the board's rounded clip — an unrounded ring runs square into the
/// clip and loses its corner. The board is the thing that knows that radius, so it hands each
/// cell the corner it sits in; nothing here would catch that going stale except a picture.
///
/// Captured at 3x, unlike the screen goldens: the whole subject is a 13px arc, and at 1x the
/// difference between following the clip and missing it is a pixel of anti-aliasing.
void main() {
  for (final (String name, int slot) in <(String, int)>[('corner', 0), ('centre', 4)]) {
    testWidgets('the ring outlines the $name cell and follows the board', (tester) async {
      final GoldenTheme theme = goldenThemes().firstWhere((t) => t.name == 'light');
      final ProviderContainer container = boardContainer(theme: theme);

      await pumpBoard(tester, container: container, devicePixelRatio: 3, theme: theme);

      // A move, the CPU's reply, then the same square again — which the domain refuses as taken.
      container.read(gameUiStateProvider.notifier).play(slot);
      await tester.pump(AppMotion.cpuThinkingDelay);
      container.read(gameUiStateProvider.notifier).play(slot);
      await tester.pumpAndSettle();

      await expectLater(find.byType(GameBoard), matchesGoldenFile('goldens/invalid_slot_$name.png'));
    });
  }
}
