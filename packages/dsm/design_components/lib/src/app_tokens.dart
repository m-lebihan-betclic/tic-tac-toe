import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';

/// How a component reads its tokens.
///
/// This package has **no Riverpod dependency** — a design-system component is a plain widget,
/// and plain widgets are what make a golden test one line long. The palette and the type scale
/// arrive as `ThemeExtension`s installed on `ThemeData` by the app, so a component reads them
/// from its `BuildContext` and a test installs a different pair by wrapping it.
///
/// The rule "a feature never reads the palette" still holds: it applies to *features*, which
/// build their own `ThemeExtension` from these tokens. Components in this package are the
/// design system, so reading the palette is exactly their job.
extension AppTokens on BuildContext {
  /// The active palette. Throws if the app forgot to install it, which is the right failure:
  /// a component silently falling back to Material's `colorScheme` would render plausibly and
  /// wrongly.
  AppPalette get palette =>
      Theme.of(this).extension<AppPalette>() ??
      (throw StateError('AppPalette is not installed on ThemeData. See buildApplication().'));

  AppTypography get typography =>
      Theme.of(this).extension<AppTypography>() ??
      (throw StateError('AppTypography is not installed on ThemeData. See buildApplication().'));
}
