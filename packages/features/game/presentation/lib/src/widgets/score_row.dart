import 'package:design_components/design_components.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';

/// The session tally. Read-only, so no press treatment anywhere in it.
class ScoreRow extends ConsumerWidget {
  const ScoreRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Scores scores = ref.watch(gameUiStateProvider.select((s) => s.scores));
    final GameOutcome? justWon = ref.watch(
      gameUiStateProvider.select(
        (s) => switch (s.banner) {
          Over(:final GameOutcome outcome) => outcome,
          _ => null,
        },
      ),
    );
    final GameTheme theme = ref.watch(gameThemeProvider);
    final AppLocalizations l10n = context.l10n;

    // On the result screen the counter that just moved is coloured; the other two stay plain.
    Color? accentFor(GameOutcome outcome) => justWon == outcome ? theme.winLineColor : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AppStat(accent: accentFor(GameOutcome.won), label: l10n.scoreYou, value: '${scores.won}'),
        AppStat(accent: accentFor(GameOutcome.drawn), label: l10n.scoreDraw, value: '${scores.drawn}'),
        AppStat(accent: accentFor(GameOutcome.lost), label: l10n.scoreCpu, value: '${scores.lost}'),
      ],
    );
  }
}
