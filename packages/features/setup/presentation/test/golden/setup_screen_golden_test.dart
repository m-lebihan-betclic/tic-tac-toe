import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:setup_presentation/setup_presentation.dart' as setup_presentation;
import 'package:setup_presentation/src/setup_screen.dart';

/// §02 — the sheet that names a player, at both widths.
///
/// Light and matrix rather than all three: dark differs from light only by palette, which the
/// component goldens already pin, while matrix swaps the type family and so is the one theme that
/// can change the layout. Two widths beat a third theme at one, which is the whole argument for
/// running these at 320 as well as at the 390 the design is drawn at.
///
/// It is captured over a plain ground rather than inside `showModalBottomSheet`: the barrier and
/// the route are composition's, and what this pins is the sheet's own column.
typedef _Theme = ({String name, AppPalette palette, AppTypography typography});

/// Nothing stored — the sheet as a cold start opens it, with an empty field and no theme chosen.
final class _EmptySession implements PlayerRepository, PreferencesRepository {
  const _EmptySession();

  @override
  Player? read() => null;

  @override
  void write(Player player) {}

  @override
  Difficulty? readDifficulty() => null;

  @override
  AppLocale? readLocale() => null;

  @override
  AppTheme? readTheme() => null;

  @override
  void writeDifficulty(Difficulty difficulty) {}

  @override
  void writeLocale(AppLocale locale) {}

  @override
  void writeTheme(AppTheme theme) {}
}

final class _NoopRouting implements setup_presentation.SetupRouting {
  const _NoopRouting();

  @override
  void onSetupCompleted() {}
}

void main() {
  final List<_Theme> themes = <_Theme>[
    (name: 'light', palette: AppPalette.light(), typography: AppTypography.system()),
    (name: 'matrix', palette: AppPalette.matrix(), typography: AppTypography.system(monospace: true)),
  ];
  const Map<String, Size> sizes = <String, Size>{'320': Size(320, 780), '390': Size(390, 780)};

  for (final _Theme theme in themes) {
    for (final MapEntry<String, Size> size in sizes.entries) {
      testWidgets('the sheet in ${theme.name} at ${size.key}', (tester) async {
        tester.view
          ..devicePixelRatio = 1
          ..physicalSize = size.value;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          ProviderScope(
            overrides: <Override>[
              ...design_providers.bindProviders(
                palette: Provider<AppPalette>((ref) => theme.palette),
                typography: Provider<AppTypography>((ref) => theme.typography),
              ),
              ...session_domain.bindProviders(
                player: Provider<PlayerRepository>((ref) => const _EmptySession()),
                preferences: Provider<PreferencesRepository>((ref) => const _EmptySession()),
              ),
              ...setup_presentation.bindProviders(routing: (ref) => const _NoopRouting()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                backgroundColor: theme.palette.background,
                body: const RepaintBoundary(
                  key: Key('golden'),
                  child: Align(alignment: Alignment.bottomCenter, child: SetupScreen()),
                ),
              ),
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

        await expectLater(
          find.byKey(const Key('golden')),
          matchesGoldenFile('goldens/setup_screen_${size.key}_${theme.name}.png'),
        );
      });
    }
  }
}
