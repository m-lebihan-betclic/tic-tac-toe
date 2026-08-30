import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'settings_theme.br.tailor.dart';

/// Every colour and type style the settings screen draws with, already resolved.
///
/// It is deliberately short. The rows, the segments and the radio are `design_components`, and
/// those read the palette themselves — the screen owns only its chrome: the ground, the header,
/// the section captions and the two lines of small print.
@TailorMixinComponent()
class SettingsTheme extends ThemeExtension<SettingsTheme> with _$SettingsThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color closeGlyphColor;

  /// The caret in the nickname field. Material would supply one off `colorScheme`, which is the
  /// one part of `ThemeData` this app deliberately does not furnish.
  @override
  final Color cursorColor;

  @override
  final TextStyle labelStyle;

  /// `Change` — the word that says the row opposite it is editable.
  @override
  final TextStyle linkStyle;

  /// The nickname itself, at the same weight a selected row's label carries.
  @override
  final TextStyle nameStyle;

  /// The difficulty caption and the footer — the same small print in both places.
  @override
  final TextStyle noteStyle;

  @override
  final TextStyle titleStyle;

  const SettingsTheme({
    required this.backgroundColor,
    required this.closeGlyphColor,
    required this.cursorColor,
    required this.labelStyle,
    required this.linkStyle,
    required this.nameStyle,
    required this.noteStyle,
    required this.titleStyle,
  });
}
