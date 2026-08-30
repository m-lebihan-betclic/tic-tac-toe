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
  /// Two lines of [GameTheme.sentenceStyle] plus the label row and its gap — as a **minimum**,
  /// not a fixed size.
  ///
  /// The floor is what the spec is really asking for: the three board states differ only in what
  /// this says, so reserving two lines means the board does not jump as the wording changes
  /// between them. Making it a ceiling as well is what cropped a descender, and would crop
  /// French or a larger text scale next. Past the floor the block grows and the board, which is
  /// Expanded, gives up the height.
  static const double _minHeight = 116;
  static const double _sentenceGap = 12;
  static const double _labelGap = 8;

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

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _minHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
          Text(sentence, style: isWarning ? theme.warningStyle : theme.sentenceStyle),
        ],
      ),
    );
  }
}
