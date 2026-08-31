import 'package:design_components/design_components.dart';
import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:history_presentation/history_presentation.dart' as history_presentation;
import 'package:history_presentation/src/history_screen.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;

/// §08, at both widths, populated and empty.
///
/// The empty state is captured because it is the one a reviewer opening the app first sees, and
/// the one nobody remembers to check: three zeroes and a single line where the card would be.
typedef _Theme = ({String name, AppPalette palette, AppTypography typography});

final class _History implements HistoryRepository {
  final List<Round> rounds;

  const _History(this.rounds);

  @override
  List<Round> read() => rounds;

  @override
  void write(Round round) {}
}

final class _NoopRouting implements history_presentation.HistoryRouting {
  const _NoopRouting();

  @override
  void onDismissHistory() {}
}

/// Newest first, the way the store keeps them — including a round won on two lines at once, which
/// is the case a `WinningLine?` would have quietly dropped.
const List<Round> _rounds = <Round>[
  Round(
    difficulty: Difficulty.hard,
    moveCount: 7,
    outcome: GameOutcome.lost,
    winningLines: <WinningLine>{WinningLine.middleRow},
  ),
  Round(difficulty: Difficulty.easy, moveCount: 9, outcome: GameOutcome.drawn),
  Round(
    difficulty: Difficulty.easy,
    moveCount: 7,
    outcome: GameOutcome.won,
    winningLines: <WinningLine>{WinningLine.leftColumn, WinningLine.diagonalDown},
  ),
];

void main() {
  final List<_Theme> themes = <_Theme>[
    (name: 'light', palette: AppPalette.light(), typography: AppTypography.system()),
    (name: 'matrix', palette: AppPalette.matrix(), typography: AppTypography.system(monospace: true)),
  ];
  const Map<String, Size> sizes = <String, Size>{'320': Size(320, 780), '390': Size(390, 780)};

  Future<void> pump(WidgetTester tester, _Theme theme, Size size, List<Round> rounds) async {
    tester.view
      ..devicePixelRatio = 1
      ..physicalSize = size;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          ...design_providers.bindProviders(
            palette: Provider<AppPalette>((ref) => theme.palette),
            typography: Provider<AppTypography>((ref) => theme.typography),
          ),
          ...session_domain.bindProviders(
            history: Provider<HistoryRepository>((ref) => _History(rounds)),
          ),
          ...history_presentation.bindProviders(routing: (ref) => const _NoopRouting()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // The app wraps every screen in this, so a golden that skipped it would pin a matrix the
          // app never shows. The capture boundary sits above it for the same reason.
          builder: (context, child) => RepaintBoundary(
            key: const Key('golden'),
            child: CrtOverlay(
              color: theme.palette.crtOverlay,
              child: child ?? const SizedBox.shrink(),
            ),
          ),
          home: const HistoryScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            extensions: <ThemeExtension<dynamic>>[theme.palette, theme.typography],
            useMaterial3: true,
          ),
        ),
      ),
    );
    await tester.pump();
  }

  for (final _Theme theme in themes) {
    for (final MapEntry<String, Size> size in sizes.entries) {
      testWidgets('rounds in ${theme.name} at ${size.key}', (tester) async {
        await pump(tester, theme, size.value, _rounds);

        await expectLater(
          find.byKey(const Key('golden')),
          matchesGoldenFile('goldens/history_screen_${size.key}_${theme.name}.png'),
        );
      });
    }
  }

  testWidgets('nothing played yet', (tester) async {
    await pump(tester, themes.first, const Size(390, 780), const <Round>[]);

    await expectLater(
      find.byKey(const Key('golden')),
      matchesGoldenFile('goldens/history_screen_empty.png'),
    );
  });
}
