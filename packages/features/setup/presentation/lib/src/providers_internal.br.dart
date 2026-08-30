import 'package:design_providers/design_providers.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:setup_presentation/src/theme/setup_theme.br.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.
@riverpod
SetupTheme defaultSetupTheme(Ref ref) {
  final AppPalette palette = ref.watch(appPaletteProvider);
  final AppTypography typography = ref.watch(appTypographyProvider);

  return SetupTheme(
    counterColor: palette.onSurfaceMuted,
    counterFullColor: palette.warning,
    fieldBorderColor: palette.outline,
    fieldFillColor: palette.background,
    fieldFocusedBorderColor: palette.primary,
    fieldStyle: palette.onSurfaceText(typography.body).copyWith(fontSize: _fieldFontSize),
    handleColor: palette.outline,
    labelStyle: typography.caption.copyWith(color: palette.onSurfaceMuted),
    sheetColor: palette.surface,
    subtitleStyle: typography.body.copyWith(
      color: palette.onSurfaceMuted,
      fontSize: _subtitleFontSize,
    ),
    titleStyle: palette.onSurfaceText(typography.title),
  );
}

/// Both off the type scale, and both drawn rather than derived: the field's 17px input text and
/// the 14.5px subtitle are this sheet's, and nothing else uses either.
const double _fieldFontSize = 17;
const double _subtitleFontSize = 14.5;
