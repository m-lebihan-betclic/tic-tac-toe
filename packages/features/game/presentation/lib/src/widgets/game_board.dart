import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:game_presentation/src/widgets/slot_button.dart';
import 'package:game_presentation/src/widgets/win_line.dart';
import 'package:session_domain/session_domain.dart';

/// Three rows of three cells that fill whatever they are given.
///
/// Columns are `Expanded`, never a width divided by three, and the gaps are fixed hairlines. The
/// board paints itself in the grid colour and lets it show through, so the lines are the
/// background rather than nine borders doubling up where cells meet. That is what makes the same
/// layout correct at 320 and at 390.
class GameBoard extends ConsumerWidget {
  /// Dimmed while the CPU is thinking; fully lit again the moment the game ends, because the
  /// result is the reward and nothing should dim it.
  static const double _thinkingOpacity = 0.55;

  const GameBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameTheme theme = ref.watch(gameThemeProvider);
    final bool isThinking = ref.watch(
      gameUiStateProvider.select((s) => s.game.status is CpuTurn),
    );
    final Set<WinningLine> winningLines = ref.watch(
      gameUiStateProvider.select(
        (s) => switch (s.game.status) {
          Finished(:final Set<WinningLine> winningLines) => winningLines,
          _ => const <WinningLine>{},
        },
      ),
    );

    return AnimatedOpacity(
      duration: AppMotion.statusCrossFade,
      opacity: isThinking ? _thinkingOpacity : 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.board),
            color: theme.gridColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.board),
            child: Stack(
              children: <Widget>[
                Column(
                  spacing: AppSizing.hairline,
                  children: <Widget>[
                    for (int row = 0; row < 3; row++)
                      Expanded(
                        child: Row(
                          spacing: AppSizing.hairline,
                          children: <Widget>[
                            for (int column = 0; column < 3; column++)
                              Expanded(child: SlotButton(slot: row * 3 + column)),
                          ],
                        ),
                      ),
                  ],
                ),
                if (winningLines.isNotEmpty)
                  Positioned.fill(
                    child: WinLine(color: theme.winLineColor, lines: winningLines),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
