import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:history_presentation/src/providers_di.br.dart';
import 'package:history_presentation/src/theme/history_theme.br.dart';
import 'package:history_presentation/src/widgets/close_glyph.dart';
import 'package:history_presentation/src/widgets/outcome_badge.dart';
import 'package:history_presentation/src/widgets/stat_card.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';

/// §08 — what happened this session: three counters and the rounds behind them.
///
/// It is the one feature here that only reads. It never touches a `Board`, a `Mark` or a rule —
/// it renders `GameOutcome` and `WinningLine`, which are the session's vocabulary rather than the
/// game's, and that is the whole reason those two live in `shared_domain`.
class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color backgroundColor = ref.watch(historyThemeProvider.select((t) => t.backgroundColor));

    return Scaffold(
      backgroundColor: backgroundColor,
      body: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _Gutter(child: _Header()),
            SizedBox(height: _headerGap),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: AppSpacing.spacing700),
                child: _Gutter(child: _Body()),
              ),
            ),
            _Gutter(child: _Footer()),
            SizedBox(height: AppSpacing.spacing800),
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

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryTheme theme = ref.watch(historyThemeProvider);

    return Padding(
      padding: const EdgeInsets.only(top: _headerTop),
      child: Row(
        spacing: _headerGlyphGap,
        children: <Widget>[
          AppIconButton(
            glyph: CloseGlyph(color: theme.closeGlyphColor),
            onPressed: ref.watch(historyRoutingProvider).onDismissHistory,
            semanticLabel: context.l10n.historyTitle,
          ),
          Expanded(child: Text(context.l10n.historyTitle, style: theme.titleStyle)),
        ],
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Round> rounds = ref.watch(storedRoundsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.spacing700,
      children: <Widget>[
        const _Stats(),
        _Rounds(rounds: rounds),
      ],
    );
  }
}

/// The three counters, read from the same projection the board's score row reads.
class _Stats extends ConsumerWidget {
  const _Stats();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.l10n;
    final HistoryTheme theme = ref.watch(historyThemeProvider);
    final Scores scores = ref.watch(storedScoresProvider);

    return Row(
      spacing: AppSpacing.spacing300,
      children: <Widget>[
        for (final (String label, int value, Color accent) in <(String, int, Color)>[
          (l10n.historyWon, scores.won, theme.wonAccent),
          (l10n.historyLost, scores.lost, theme.lostAccent),
          (l10n.historyDrawn, scores.drawn, theme.drawnAccent),
        ])
          Expanded(
            child: StatCard(
              // A zero recedes wherever it appears — the same rule the board's score row keeps,
              // and the reason the empty state is three grey noughts rather than three lit ones.
              accent: value == 0 ? theme.zeroAccent : accent,
              label: label,
              labelStyle: theme.labelStyle,
              value: '$value',
              valueStyle: theme.statValueStyle,
            ),
          ),
      ],
    );
  }
}

class _Rounds extends ConsumerWidget {
  final List<Round> rounds;

  const _Rounds({required this.rounds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HistoryTheme theme = ref.watch(historyThemeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.spacing300,
      children: <Widget>[
        Text(context.l10n.historyRounds, style: theme.labelStyle),
        if (rounds.isEmpty)
          Text(context.l10n.historyEmpty, style: theme.emptyStyle)
        else
          AppCard(
            children: <Widget>[
              // Newest first, which is the order the store keeps them in — so the index counts
              // down from the total rather than up from the top of the list.
              for (final (int position, Round round) in rounds.indexed)
                _RoundRow(number: rounds.length - position, round: round),
            ],
          ),
      ],
    );
  }
}

class _RoundRow extends ConsumerWidget {
  final int number;
  final Round round;

  const _RoundRow({required this.number, required this.round});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = context.l10n;
    final HistoryTheme theme = ref.watch(historyThemeProvider);
    final Color accent = switch (round.outcome) {
      GameOutcome.drawn => theme.drawnAccent,
      GameOutcome.lost => theme.lostAccent,
      GameOutcome.won => theme.wonAccent,
    };

    return SizedBox(
      height: AppSizing.listRow,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing400),
        child: Row(
          spacing: AppSpacing.spacing300,
          children: <Widget>[
            Text('$number'.padLeft(2, '0'), style: theme.indexStyle),
            Expanded(
              child: Text(
                _describe(round, l10n),
                overflow: TextOverflow.ellipsis,
                style: theme.roundStyle,
              ),
            ),
            OutcomeBadge(
              color: accent,
              // The initial of the localised word, not a hardcoded `W`. The badge is the label in
              // one character, so it has to follow the label into French — where "GAGNÉ" gives a
              // G — rather than smuggle an English letter through a translated screen.
              letter: switch (round.outcome) {
                GameOutcome.drawn => l10n.historyDrawn,
                GameOutcome.lost => l10n.historyLost,
                GameOutcome.won => l10n.historyWon,
              }.characters.first,
              style: theme.indexStyle,
            ),
          ],
        ),
      ),
    );
  }

  /// `Won · left column`, built from the enum rather than from a string.
  ///
  /// The line is a [WinningLine], and presentation maps it to a key — a free `String` here would
  /// mean something had to produce the words "left column", and that something would be Dart, and
  /// it would read `Gagné · left column` in French. A move that completes two lines names both,
  /// because dropping one would be reporting less than happened.
  String _describe(Round round, AppLocalizations l10n) {
    final String lines = round.winningLines.map((line) => _lineNoun(line, l10n)).join(', ');

    return switch (round.outcome) {
      GameOutcome.drawn => l10n.historyRoundDrawn(round.moveCount),
      GameOutcome.lost => l10n.historyRoundLost(lines),
      GameOutcome.won => l10n.historyRoundWon(lines),
    };
  }

  String _lineNoun(WinningLine line, AppLocalizations l10n) => switch (line) {
    WinningLine.bottomRow => l10n.lineBottomRow,
    WinningLine.diagonalDown => l10n.lineDiagonalDown,
    WinningLine.diagonalUp => l10n.lineDiagonalUp,
    WinningLine.leftColumn => l10n.lineLeftColumn,
    WinningLine.middleColumn => l10n.lineMiddleColumn,
    WinningLine.middleRow => l10n.lineMiddleRow,
    WinningLine.rightColumn => l10n.lineRightColumn,
    WinningLine.topRow => l10n.lineTopRow,
  };
}

class _Footer extends ConsumerWidget {
  const _Footer();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Text(
    context.l10n.historyFooter,
    style: ref.watch(historyThemeProvider.select((t) => t.noteStyle)),
  );
}

const double _headerGap = AppSpacing.spacing800;
const double _headerGlyphGap = 14;
const double _headerTop = AppSpacing.spacing550;
