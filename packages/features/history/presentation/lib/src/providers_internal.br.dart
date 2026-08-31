import 'package:design_providers/design_providers.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:history_presentation/src/theme/history_theme.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.
@riverpod
HistoryTheme defaultHistoryTheme(Ref ref) {
  final AppPalette palette = ref.watch(appPaletteProvider);
  final AppTypography typography = ref.watch(appTypographyProvider);

  return HistoryTheme(
    backgroundColor: palette.background,
    closeGlyphColor: palette.onSurface,
    // A draw is nobody's win, so it takes the plain ink rather than a colour of its own.
    drawnAccent: palette.onSurface,
    emptyStyle: typography.body.copyWith(color: palette.onSurfaceMuted, fontSize: _roundFontSize),
    indexStyle: typography.caption.copyWith(color: palette.onSurfaceMuted),
    labelStyle: typography.caption.copyWith(color: palette.onSurfaceMuted),
    lostAccent: palette.markCpu,
    noteStyle: typography.body.copyWith(color: palette.onSurfaceMuted, fontSize: _noteFontSize),
    roundStyle: palette.onSurfaceText(typography.body).copyWith(fontSize: _roundFontSize, fontWeight: FontWeight.w500),
    statValueStyle: typography.statValue.copyWith(fontSize: _statFontSize, fontWeight: FontWeight.w600),
    titleStyle: palette.onSurfaceText(typography.prominent),
    wonAccent: palette.success,
    zeroAccent: palette.onSurfaceMuted,
  );
}

/// The stat card's number, the one place the app sets type this large.
const double _statFontSize = 30;

/// A round's description, between the body size and the caption.
const double _roundFontSize = 15.5;

/// The footer's small print, the same size settings uses.
const double _noteFontSize = 12.5;
