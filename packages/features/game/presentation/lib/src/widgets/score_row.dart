import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';

/// The level on the left, the session tally on the right. Read-only, so no press treatment
/// anywhere in it — a surface that reacts to touch and then does nothing is worse than one that
/// ignores it.
class ScoreRow extends ConsumerWidget {
  const ScoreRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Difficulty difficulty = ref.watch(gameUiStateProvider.select((s) => s.game.difficulty));
    final Scores scores = ref.watch(gameUiStateProvider.select((s) => s.scores));
    // On the result screen the counter that just moved is coloured; the other two stay plain.
    final GameOutcome? justEnded = ref.watch(
      gameUiStateProvider.select(
        (s) => switch (s.banner) {
          Over(:final GameOutcome outcome) => outcome,
          _ => null,
        },
      ),
    );
    final GameTheme theme = ref.watch(gameThemeProvider);
    final AppLocalizations l10n = context.l10n;

    Color? accentFor(GameOutcome outcome) => justEnded == outcome ? theme.winLineColor : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          switch (difficulty) {
            Difficulty.easy => l10n.difficultyEasy,
            Difficulty.hard => l10n.difficultyHard,
          }.toUpperCase(),
          style: theme.labelStyle,
        ),
        // Scaled down rather than allowed to overflow. This row is six text runs with no give in
        // it, so a narrow viewport, a long translation or a large Dynamic Type setting all push
        // it past the gutter — 390 is the width the design is drawn at, not the only one it has
        // to survive. At the reference width nothing scales; below it the cluster shrinks as a
        // whole, which keeps the three tallies reading as one row instead of dropping one.
        Flexible(
          child: FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSpacing.spacing400,
              children: <Widget>[
                AppStat(accent: accentFor(GameOutcome.won), label: l10n.scoreYou, value: '${scores.won}'),
                AppStat(accent: accentFor(GameOutcome.lost), label: l10n.scoreCpu, value: '${scores.lost}'),
                AppStat(
                  accent: accentFor(GameOutcome.drawn),
                  label: l10n.scoreDraw,
                  value: '${scores.drawn}',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
