import 'package:design_providers/design_providers.dart' as design_providers;
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:l10n/l10n.dart';
import 'package:splash_presentation/splash_presentation.dart' as splash_presentation;
import 'package:splash_presentation/src/splash_screen.dart';

/// §01 is always system light or dark, never matrix — no preference is stored at splash time.
/// Both widths run, so a pinned dimension fails the build.
void main() {
  final palettes = <String, AppPalette>{'light': AppPalette.light(), 'dark': AppPalette.dark()};
  const sizes = <String, Size>{'320': Size(320, 780), '390': Size(390, 780)};

  for (final MapEntry<String, AppPalette> palette in palettes.entries) {
    for (final MapEntry<String, Size> size in sizes.entries) {
      testWidgets('splash renders in ${palette.key} at ${size.key}', (tester) async {
        tester.view
          ..devicePixelRatio = 1
          ..physicalSize = size.value;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          ProviderScope(
            overrides: <Override>[
              ...design_providers.bindProviders(
                palette: Provider<AppPalette>((ref) => palette.value),
                typography: Provider<AppTypography>((ref) => AppTypography.system()),
              ),
              ...splash_presentation.bindProviders(routing: (ref) => const _NoopRouting()),
            ],
            child: MaterialApp(
              home: const RepaintBoundary(key: Key('golden'), child: SplashScreen()),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: ThemeData(
                extensions: <ThemeExtension<dynamic>>[palette.value, AppTypography.system()],
                useMaterial3: true,
              ),
            ),
          ),
        );
        // The dots repeat forever, so `pumpAndSettle` would never return: pump one frame.
        await tester.pump();

        await expectLater(
          find.byKey(const Key('golden')),
          matchesGoldenFile('goldens/splash_${palette.key}_${size.key}.png'),
        );
      });
    }
  }
}

final class _NoopRouting implements splash_presentation.SplashRouting {
  const _NoopRouting();

  @override
  void onSplashCompleted() {}
}
