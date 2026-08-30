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
          // The grid colour fills the container and shows through wherever the cells do not
          // cover it: a hairline between them, and a hairline of padding around them. The outer
          // edge is that padding rather than a border — a `border` on the decoration would be
          // painted and then covered, because the cells are not inset for it.
          child: Padding(
            padding: const EdgeInsets.all(AppSizing.hairline),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(_innerCorner),
              child: Stack(
                children: <Widget>[
                  Column(
                    spacing: AppSizing.hairline,
                    children: <Widget>[
                      for (int row = 0; row < _side; row++)
                        Expanded(
                          child: Row(
                            spacing: AppSizing.hairline,
                            children: <Widget>[
                              for (int column = 0; column < _side; column++) _cell(row * _side + column),
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
      ),
    );
  }
}

/// One cell, carrying the board corner it sits in.
Widget _cell(int slot) => Expanded(
  child: SlotButton(corner: _slotCorners[slot], slot: slot),
);

/// The radius the cells actually meet: the board's own, less the hairline of padding that draws
/// its outer edge.
const Radius _innerCorner = Radius.circular(AppRadius.board - AppSizing.hairline);

const int _side = 3;

/// Which of the board's own corners each slot sits in — row-major, so the four rounded entries
/// are the four corners of the grid and the five between them are square.
///
/// The corner cells are clipped by the board's rounded edge, so anything one of them draws on its
/// own outline — the invalid ring — has to be rounded the same way or it loses its corner to the
/// clip. It lives here rather than in the cell because the board is what owns the clip, and a
/// cell re-deriving the radius would be a second copy of it.
///
/// Written out rather than computed per build. The nine values never change, so the grid loop
/// hands out canonical instances instead of allocating nine equal ones on both halves of every
/// turn handover — and equal-but-distinct `BorderRadius`es would compare field by field where
/// identical ones compare by reference.
const List<BorderRadius> _slotCorners = <BorderRadius>[
  BorderRadius.only(topLeft: _innerCorner),
  BorderRadius.zero,
  BorderRadius.only(topRight: _innerCorner),
  BorderRadius.zero,
  BorderRadius.zero,
  BorderRadius.zero,
  BorderRadius.only(bottomLeft: _innerCorner),
  BorderRadius.zero,
  BorderRadius.only(bottomRight: _innerCorner),
];
