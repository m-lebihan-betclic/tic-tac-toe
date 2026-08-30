import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:settings_presentation/settings_presentation.dart' as settings_presentation;
import 'package:settings_presentation/src/settings_screen.dart';

/// §07 — the whole screen, at both widths.
///
/// Light and matrix rather than all three: dark differs from light only by palette, which the
/// component goldens already pin, while matrix swaps the type family and so is the one theme that
/// can change the layout — the two segmented controls and the footer are where that shows.
typedef _Theme = ({String name, AppPalette palette, AppTypography typography});

/// A session already set up: settings is only reachable once somebody has a name.
final class _Session implements PlayerRepository, PreferencesRepository {
  const _Session();

  @override
  Player? read() => Player.create('Morgan').getOrNull();

  @override
  void write(Player player) {}

  @override
  Difficulty? readDifficulty() => Difficulty.easy;

  @override
  AppLocale? readLocale() => AppLocale.en;

  @override
  AppTheme? readTheme() => AppTheme.light;

  @override
  void writeDifficulty(Difficulty difficulty) {}

  @override
  void writeLocale(AppLocale locale) {}

  @override
  void writeTheme(AppTheme theme) {}
}

final class _NoopRouting implements settings_presentation.SettingsRouting {
  const _NoopRouting();

  @override
  void onDismissSettings() {}
}

void main() {
  final List<_Theme> themes = <_Theme>[
    (name: 'light', palette: AppPalette.light(), typography: AppTypography.system()),
    (name: 'matrix', palette: AppPalette.matrix(), typography: AppTypography.system(monospace: true)),
  ];
  const Map<String, Size> sizes = <String, Size>{'320': Size(320, 780), '390': Size(390, 780)};

  for (final _Theme theme in themes) {
    for (final MapEntry<String, Size> size in sizes.entries) {
      testWidgets('settings in ${theme.name} at ${size.key}', (tester) async {
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
                player: Provider<PlayerRepository>((ref) => const _Session()),
                preferences: Provider<PreferencesRepository>((ref) => const _Session()),
              ),
              ...settings_presentation.bindProviders(
                locale: Provider<AppLocale>((ref) => AppLocale.en),
                player: Provider<Player>((ref) => Player.create('Morgan').getOrThrow()),
                routing: (ref) => const _NoopRouting(),
                // The theme in force, which is what the selected row reports — the palette above
                // is the same choice, seen from composition's other side.
                theme: Provider<AppTheme>(
                  (ref) => theme.name == 'matrix' ? AppTheme.matrix : AppTheme.light,
                ),
                version: Provider<String>((ref) => '1.0.0'),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const RepaintBoundary(key: Key('golden'), child: SettingsScreen()),
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
          matchesGoldenFile('goldens/settings_screen_${size.key}_${theme.name}.png'),
        );
      });
    }
  }
}
