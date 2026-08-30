import 'package:design_components/design_components.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';

/// The dot, the label and the sentence.
///
/// Fixed height, so the board never shifts when the wording changes — the three board states
/// differ in what this says and in nothing else.
class StatusBlock extends ConsumerWidget {
  /// Two lines of [GameTheme.sentenceStyle] plus the label row and its gap. Fixed, because the
  /// board must not shift when the wording changes — and tall enough for two lines, because
  /// `Board cleared. Your turn, {name}.` is two on a narrow screen and one on a wide one.
  static const double _height = 96;
  static const double _sentenceGap = 12;
  static const double _labelGap = 8;
  static const int _sentenceMaxLines = 2;

  const StatusBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StatusBanner banner = ref.watch(gameUiStateProvider.select((s) => s.banner));
    final String name = ref.watch(gameUiStateProvider.select((s) => s.player.name));
    final GameTheme theme = ref.watch(gameThemeProvider);
    final AppLocalizations l10n = context.l10n;

    final (Color dotColor, String label, String sentence, bool isWarning) = switch (banner) {
      Cleared() => (theme.turnDotColor, l10n.labelYourTurn, l10n.statusReset(name), false),
      Invalid() => (theme.warningColor, l10n.labelTaken, l10n.errorSlotTaken, true),
      Over(:final GameOutcome outcome) => (
        switch (outcome) {
          GameOutcome.drawn => theme.drawnDotColor,
          GameOutcome.lost => theme.lostDotColor,
          GameOutcome.won => theme.wonDotColor,
        },
        l10n.labelGameOver,
        switch (outcome) {
          GameOutcome.drawn => l10n.resultDraw,
          GameOutcome.lost => l10n.resultLost,
          GameOutcome.won => l10n.resultWon(name),
        },
        false,
      ),
      Thinking() => (theme.cpuDotColor, l10n.labelCpu, l10n.statusCpuTurn, false),
      Turn() => (theme.turnDotColor, l10n.labelYourTurn, l10n.statusPlayerTurn(name), false),
    };

    return SizedBox(
      height: _height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: _labelGap,
            children: <Widget>[
              StatusDot(blinking: banner is Thinking, color: dotColor),
              Text(label, style: theme.labelStyle),
              if (banner is Thinking) BlinkingDots(color: theme.cpuDotColor),
            ],
          ),
          const SizedBox(height: _sentenceGap),
          // Expanded, so the sentence is bounded by the block instead of overflowing it. The
          // height stays fixed — the board must not shift when the wording changes — and a
          // sentence that would need a third line ellipsises rather than pushing the board down.
          Expanded(
            child: Text(
              sentence,
              maxLines: _sentenceMaxLines,
              overflow: TextOverflow.ellipsis,
              style: isWarning ? theme.warningStyle : theme.sentenceStyle,
            ),
          ),
        ],
      ),
    );
  }
}
