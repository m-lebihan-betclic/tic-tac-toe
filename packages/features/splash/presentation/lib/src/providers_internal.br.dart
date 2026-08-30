import 'package:design_providers/design_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splash_presentation/src/theme/splash_theme.br.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the design-system tokens. This is the only place
/// in the feature that reads the palette or the type scale: everything else reads
/// `splashThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.
@riverpod
SplashTheme defaultSplashTheme(Ref ref) {
  final palette = ref.watch(appPaletteProvider);
  final typography = ref.watch(appTypographyProvider);

  return SplashTheme(
    backgroundColor: palette.background,
    dotColor: palette.onSurfaceMuted,
    markCpuColor: palette.markCpu,
    markOutlineColor: palette.outline,
    markPlayerColor: palette.markPlayer,
    taglineStyle: typography.body.copyWith(color: palette.onSurfaceMuted),
    wordmarkStyle: palette.onSurfaceText(typography.wordmark),
  );
}
