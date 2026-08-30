import 'dart:math';

import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/game_presentation.dart' as game_presentation;
import 'package:game_presentation/src/game_screen.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/widgets/game_board.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:session_domain/session_domain.dart' as session_domain;

final class _EmptyPreferences implements PreferencesRepository {
  const _EmptyPreferences();
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

final class _NoopRouting implements game_presentation.GameRouting {
  const _NoopRouting();
  @override
  void onHistoryRequested() {}
  @override
  void onSettingsRequested() {}
}

ProviderContainer _container() => ProviderContainer(
  overrides: <Override>[
    // The easy CPU takes a win if there is one and otherwise plays a random free slot, so
    // without a seed the reply lands somewhere new every run and the picture never matches
    // itself. This is the seam that exists for exactly this.
    cpuRandomProvider.overrideWith((ref) => Random(_seed)),
    ...design_providers.bindProviders(
      palette: Provider<AppPalette>((ref) => AppPalette.light()),
      typography: Provider<AppTypography>((ref) => AppTypography.system()),
    ),
    ...session_domain.bindProviders(
      preferences: Provider<PreferencesRepository>((ref) => const _EmptyPreferences()),
    ),
    ...game_presentation.bindProviders(
      player: Provider<Player>((ref) => Player.create('Morgan').getOrThrow()),
      routing: (ref) => const _NoopRouting(),
    ),
  ],
);

/// The invalid ring, on a corner cell and on the centre one.
///
/// It is pinned because it has been wrong twice. The ring is the cell's own outline, so on a
/// corner cell it has to follow the board's rounded clip — an unrounded ring runs square into the
/// clip and loses its corner. The board is the thing that knows that radius, so it hands each
/// cell the corner it sits in; nothing here would catch that going stale except a picture.
const int _seed = 7;

void main() {
  for (final (String name, int slot) in <(String, int)>[('corner', 0), ('centre', 4)]) {
    testWidgets('the ring outlines the $name cell and follows the board', (tester) async {
      final ProviderContainer container = _container();
      addTearDown(container.dispose);
      tester.view
        ..devicePixelRatio = 3
        ..physicalSize = const Size(390 * 3, 780 * 3);
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp(
            home: const GameScreen(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              extensions: <ThemeExtension<dynamic>>[AppPalette.light(), AppTypography.system()],
              useMaterial3: true,
            ),
          ),
        ),
      );
      await tester.pump();

      container.read(gameUiStateProvider.notifier).play(slot);
      await tester.pump(AppMotion.cpuThinkingDelay);
      container.read(gameUiStateProvider.notifier).play(slot);
      await tester.pumpAndSettle();

      await expectLater(find.byType(GameBoard), matchesGoldenFile('goldens/invalid_slot_$name.png'));
    });
  }
}
