import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/routing/game_routing.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:game_presentation/src/widgets/game_board.dart';
import 'package:game_presentation/src/widgets/glyphs.dart';
import 'package:game_presentation/src/widgets/score_row.dart';
import 'package:game_presentation/src/widgets/status_block.dart';
import 'package:l10n/l10n.dart';

/// One layout, three states. Nothing moves between them except the status block, the board's
/// opacity and one cell decoration.
class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameTheme theme = ref.watch(gameThemeProvider);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      // The gutter is applied per section rather than to the whole column: the footer hairline
      // is full-bleed, separating the screen from its edge rather than one row from the next, and
      // a padded column would inset it along with everything else.
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _Gutter(child: _AppBar()),
            SizedBox(height: _statusTop),
            _Gutter(child: StatusBlock()),
            SizedBox(height: _boardTop),
            // Expanded, not a fixed board plus a Spacer: the board is square, so sizing it off
            // the width alone asks for more height than exists the moment the viewport is
            // shorter than it is wide. Taking the leftover height and centring in it is what
            // makes one layout correct at 320, at 390 and beyond.
            Expanded(
              // Top-aligned, not centred: the board sits directly under the status block and
              // the slack falls below it, which is where the design puts the breathing room.
              child: _Gutter(
                child: Align(alignment: Alignment.topCenter, child: GameBoard()),
              ),
            ),
            AppSeparator.fullBleed(),
            SizedBox(height: _footerGap),
            _Gutter(child: ScoreRow()),
            SizedBox(height: _footerGap),
            _Gutter(child: _ResetButton()),
            SizedBox(height: _footerGap),
          ],
        ),
      ),
    );
  }
}

class _Gutter extends StatelessWidget {
  final Widget child;

  const _Gutter({required this.child});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.gutter),
    child: child,
  );
}

class _AppBar extends ConsumerWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameTheme theme = ref.watch(gameThemeProvider);
    final GameRouting routing = ref.watch(gameRoutingProvider);
    final AppLocalizations l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(top: _appBarTop),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NineSquareMark.appBar(
            cpuColor: theme.markCpuColor,
            outlineColor: theme.markOutlineColor,
            playerColor: theme.markPlayerColor,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: _iconGap,
            children: <Widget>[
              AppIconButton(
                glyph: HistoryGlyph(color: theme.sentenceStyle.color!),
                onPressed: routing.onHistoryRequested,
                semanticLabel: l10n.historyTitle,
              ),
              AppIconButton(
                glyph: SettingsGlyph(color: theme.sentenceStyle.color!),
                onPressed: routing.onSettingsRequested,
                semanticLabel: l10n.settingsTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// `Reset game` while a round is live, `New game` once it is over — and enabled throughout,
/// including during the CPU's turn, which is exactly why the thinking beat is cancellable.
class _ResetButton extends ConsumerWidget {
  const _ResetButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOver = ref.watch(gameUiStateProvider.select((s) => s.game.status is Finished));
    // Nothing to clear on an empty board, so the button says so rather than looking live and
    // doing nothing. It comes back the moment the first mark lands.
    final bool hasMoves = ref.watch(gameUiStateProvider.select((s) => s.game.board.moveCount > 0));
    final VoidCallback? onPressed = hasMoves ? ref.read(gameUiStateProvider.notifier).reset : null;

    return isOver
        ? AppButton.primary(label: context.l10n.actionNewGame, onPressed: onPressed)
        : AppButton.secondary(label: context.l10n.actionReset, onPressed: onPressed);
  }
}

const double _appBarTop = 20;
const double _iconGap = AppSpacing.spacing250;
const double _statusTop = 34;
const double _boardTop = 28;
const double _footerGap = AppSpacing.spacing400;
