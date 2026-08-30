import 'package:design_providers/design_providers.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:settings_presentation/src/theme/settings_theme.br.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.
@riverpod
SettingsTheme defaultSettingsTheme(Ref ref) {
  final AppPalette palette = ref.watch(appPaletteProvider);
  final AppTypography typography = ref.watch(appTypographyProvider);

  return SettingsTheme(
    backgroundColor: palette.background,
    closeGlyphColor: palette.onSurface,
    cursorColor: palette.primary,
    labelStyle: typography.caption.copyWith(color: palette.onSurfaceMuted),
    linkStyle: typography.body.copyWith(
      color: palette.primary,
      fontSize: _linkFontSize,
      fontWeight: FontWeight.w500,
    ),
    nameStyle: palette.onSurfaceText(typography.body).copyWith(fontWeight: FontWeight.w500),
    noteStyle: typography.body.copyWith(color: palette.onSurfaceMuted, fontSize: _noteFontSize),
    titleStyle: palette.onSurfaceText(typography.prominent),
  );
}

/// `Change`, at 14px — a step down from the nickname beside it, so the row reads name-first.
const double _linkFontSize = 14;

/// The small print, at 12.5px. Drawn rather than derived: this screen is the only thing that
/// sets type below the caption size, so it is a constant here and not a ninth style on the scale.
const double _noteFontSize = 12.5;
