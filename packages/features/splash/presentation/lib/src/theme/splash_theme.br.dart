import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'splash_theme.br.tailor.dart';

@TailorMixinComponent()
class SplashTheme extends ThemeExtension<SplashTheme> with _$SplashThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color dotColor;
  @override
  final Color markCpuColor;
  @override
  final Color markOutlineColor;
  @override
  final Color markPlayerColor;
  @override
  final TextStyle taglineStyle;
  @override
  final TextStyle wordmarkStyle;

  const SplashTheme({
    required this.backgroundColor,
    required this.dotColor,
    required this.markCpuColor,
    required this.markOutlineColor,
    required this.markPlayerColor,
    required this.taglineStyle,
    required this.wordmarkStyle,
  });
}
