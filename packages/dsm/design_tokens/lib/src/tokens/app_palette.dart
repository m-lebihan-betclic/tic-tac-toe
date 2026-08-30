import 'package:flutter/material.dart';

/// The eleven colour roles, in three themes.
///
/// A feature never reads these values directly: it builds its own `ThemeExtension` from a
/// palette in its `providers_internal.br.dart`, and its widgets read that.
///
/// [primary] and [markPlayer] hold the same value in all three themes, deliberately, and stay
/// two roles. [primary] is the interactive accent — selected chips, the focused input border,
/// the start button, the `Change` link, the turn dot. [markPlayer] is the player's identity on
/// the board — the X strokes, the winning line, the `YOU` tally. They match because the player
/// mark and the interactive accent are meant to read as one colour. Collapsing them into a
/// single token would mean a future accent change
/// silently repainting the board. A button never reads [markPlayer]; the board never reads
/// [primary].
class AppPalette extends ThemeExtension<AppPalette> {
  final Color background;

  /// Tint of the CRT scanline overlay, `null` outside the matrix theme.
  final Color? crtOverlay;

  final Color markCpu;
  final Color markPlayer;
  final Color onSurface;
  final Color onSurfaceMuted;
  final Color outline;

  /// Phosphor bloom applied to `onSurface` text, `null` outside the matrix theme.
  final Shadow? phosphorBloom;

  final Color primary;
  final Color success;
  final Color surface;
  final Color surfacePressed;
  final Color warning;

  const AppPalette({
    required this.background,
    required this.crtOverlay,
    required this.markCpu,
    required this.markPlayer,
    required this.onSurface,
    required this.onSurfaceMuted,
    required this.outline,
    required this.phosphorBloom,
    required this.primary,
    required this.success,
    required this.surface,
    required this.surfacePressed,
    required this.warning,
  });

  factory AppPalette.light() => const AppPalette(
    background: Color(0xFFFAFAF8),
    crtOverlay: null,
    markCpu: Color(0xFFD8552F),
    markPlayer: _lightAccent,
    onSurface: Color(0xFF16181C),
    onSurfaceMuted: Color(0xFF6B7280),
    outline: Color(0xFFE4E4E0),
    phosphorBloom: null,
    primary: _lightAccent,
    success: Color(0xFF17875A),
    surface: Color(0xFFFFFFFF),
    surfacePressed: Color(0xFFF1F1EE),
    warning: Color(0xFFB26A00),
  );

  factory AppPalette.dark() => const AppPalette(
    background: Color(0xFF0B0C0E),
    crtOverlay: null,
    markCpu: Color(0xFFFF8A6B),
    markPlayer: _darkAccent,
    onSurface: Color(0xFFF2F4F7),
    onSurfaceMuted: Color(0xFF9AA1AC),
    outline: Color(0xFF23262C),
    phosphorBloom: null,
    primary: _darkAccent,
    success: Color(0xFF4FD08A),
    surface: Color(0xFF14161A),
    surfacePressed: Color(0xFF1B1E24),
    warning: Color(0xFFFFC24B),
  );

  factory AppPalette.matrix() => const AppPalette(
    background: Color(0xFF000000),
    crtOverlay: _matrixAccent,
    markCpu: Color(0xFFE9FFEF),
    markPlayer: _matrixAccent,
    onSurface: Color(0xFFC7FFD6),
    onSurfaceMuted: Color(0xFF3F9B58),
    outline: Color(0xFF10361D),
    phosphorBloom: Shadow(color: Color(0x806BFF8E), blurRadius: 9),
    primary: _matrixAccent,
    success: _matrixAccent,
    surface: Color(0xFF04120A),
    surfacePressed: Color(0xFF0A2413),
    warning: Color(0xFFFFD34B),
  );

  static const Color _darkAccent = Color(0xFF6E9BFF);
  static const Color _lightAccent = Color(0xFF2C5FE0);
  static const Color _matrixAccent = Color(0xFF6BFF8E);

  /// Text sitting on a [primary] fill is always [background] of the same theme.
  Color get onPrimary => background;

  /// [style] as this theme sets `onSurface` text: matrix blooms it, the other two leave it flat.
  ///
  /// The bloom belongs to the palette rather than to any feature theme, because it is a property
  /// of the theme and not of a screen — a feature that forgot it would look subtly unfinished in
  /// exactly one theme, which is the hardest kind of gap to notice.
  ///
  /// It is applied to the type that carries a screen — a title, the status sentence, the
  /// wordmark — and not to every label: a 9px blur behind a 12px caption reads as blur rather
  /// than as glow.
  TextStyle onSurfaceText(TextStyle style) => switch (phosphorBloom) {
    final Shadow bloom => style.copyWith(color: onSurface, shadows: <Shadow>[bloom]),
    null => style.copyWith(color: onSurface),
  };

  /// The pressed tone of a **filled** surface: the fill washed with 12% of its own foreground.
  /// Derived rather than tokenised, so it stays correct in all three themes and adding a new
  /// filled component never means adding a new colour.
  Color pressedFill(Color fill, Color foreground) => Color.alphaBlend(foreground.withValues(alpha: 0.12), fill);

  @override
  AppPalette copyWith({
    Color? background,
    Color? crtOverlay,
    Color? markCpu,
    Color? markPlayer,
    Color? onSurface,
    Color? onSurfaceMuted,
    Color? outline,
    Shadow? phosphorBloom,
    Color? primary,
    Color? success,
    Color? surface,
    Color? surfacePressed,
    Color? warning,
  }) => AppPalette(
    background: background ?? this.background,
    crtOverlay: crtOverlay ?? this.crtOverlay,
    markCpu: markCpu ?? this.markCpu,
    markPlayer: markPlayer ?? this.markPlayer,
    onSurface: onSurface ?? this.onSurface,
    onSurfaceMuted: onSurfaceMuted ?? this.onSurfaceMuted,
    outline: outline ?? this.outline,
    phosphorBloom: phosphorBloom ?? this.phosphorBloom,
    primary: primary ?? this.primary,
    success: success ?? this.success,
    surface: surface ?? this.surface,
    surfacePressed: surfacePressed ?? this.surfacePressed,
    warning: warning ?? this.warning,
  );

  /// Required by `ThemeExtension`, and load-bearing: `MaterialApp` lerps its theme over
  /// `themeAnimationDuration`, which is what makes the 200ms `themeSwitch` in the spec a colour
  /// fade rather than a hard cut. Without this the three themes would snap.
  @override
  AppPalette lerp(covariant AppPalette? other, double t) {
    if (other == null) return this;

    return AppPalette(
      background: Color.lerp(background, other.background, t)!,
      crtOverlay: Color.lerp(crtOverlay, other.crtOverlay, t),
      markCpu: Color.lerp(markCpu, other.markCpu, t)!,
      markPlayer: Color.lerp(markPlayer, other.markPlayer, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceMuted: Color.lerp(onSurfaceMuted, other.onSurfaceMuted, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      phosphorBloom: Shadow.lerp(phosphorBloom, other.phosphorBloom, t),
      primary: Color.lerp(primary, other.primary, t)!,
      success: Color.lerp(success, other.success, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfacePressed: Color.lerp(surfacePressed, other.surfacePressed, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
    );
  }
}
