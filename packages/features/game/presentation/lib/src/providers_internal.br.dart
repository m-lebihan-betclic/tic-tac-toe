import 'package:design_providers/design_providers.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the design-system tokens. This is the only place in
/// the feature that reads the palette or the type scale: everything else reads
/// `gameThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.
@riverpod
GameTheme defaultGameTheme(Ref ref) {
  final AppPalette palette = ref.watch(appPaletteProvider);
  final AppTypography typography = ref.watch(appTypographyProvider);

  return GameTheme(
    backgroundColor: palette.background,
    cellColor: palette.background,
    cellPressedColor: palette.surfacePressed,
    cpuDotColor: palette.markCpu,
    drawnDotColor: palette.onSurfaceMuted,
    // The board paints itself in the grid colour and lets it show through the cell gaps, so the
    // hairlines are the background rather than nine borders that would double up where cells meet.
    gridColor: palette.outline,
    labelStyle: typography.caption.copyWith(color: palette.onSurfaceMuted),
    lostDotColor: palette.markCpu,
    markCpuColor: palette.markCpu,
    markOutlineColor: palette.outline,
    markPlayerColor: palette.markPlayer,
    pressedDotColor: palette.outline.withValues(alpha: _pressedDotOpacity),
    sentenceStyle: typography.title.copyWith(color: palette.onSurface),
    turnDotColor: palette.primary,
    warningColor: palette.warning,
    warningStyle: typography.warningText(palette.warning),
    winLineColor: palette.success,
    wonDotColor: palette.success,
  );
}

/// The dot inside a pressed empty cell, drawn at 40% of the outline colour.
const double _pressedDotOpacity = 0.4;
