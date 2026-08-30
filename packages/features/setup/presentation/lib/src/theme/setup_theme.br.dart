import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'setup_theme.br.tailor.dart';

@TailorMixinComponent()
class SetupTheme extends ThemeExtension<SetupTheme> with _$SetupThemeTailorMixin {
  @override
  final Color counterColor;
  @override
  final Color counterFullColor;
  @override
  final Color fieldBorderColor;
  @override
  final Color fieldFocusedBorderColor;
  @override
  final Color fieldFillColor;
  @override
  final TextStyle fieldStyle;
  @override
  final Color handleColor;
  @override
  final TextStyle labelStyle;
  @override
  final Color sheetColor;
  @override
  final TextStyle subtitleStyle;
  @override
  final TextStyle titleStyle;

  const SetupTheme({
    required this.counterColor,
    required this.counterFullColor,
    required this.fieldBorderColor,
    required this.fieldFillColor,
    required this.fieldFocusedBorderColor,
    required this.fieldStyle,
    required this.handleColor,
    required this.labelStyle,
    required this.sheetColor,
    required this.subtitleStyle,
    required this.titleStyle,
  });
}
