import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'game_theme.br.tailor.dart';

/// Every colour and type style the board draws with, already resolved.
///
/// The screen never reads the palette or the type scale — it reads this, and composition can
/// replace the whole thing without a widget changing.
@TailorMixinComponent()
class GameTheme extends ThemeExtension<GameTheme> with _$GameThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color cellColor;
  @override
  final Color cellPressedColor;
  @override
  final Color cpuDotColor;
  @override
  final Color drawnDotColor;
  @override
  final Color gridColor;
  @override
  final TextStyle labelStyle;
  @override
  final Color lostDotColor;
  @override
  final Color markCpuColor;
  @override
  final Color markOutlineColor;
  @override
  final Color markPlayerColor;
  @override
  final Color pressedDotColor;
  @override
  final TextStyle sentenceStyle;
  @override
  final Color turnDotColor;
  @override
  final Color warningColor;
  @override
  final TextStyle warningStyle;
  @override
  final Color winLineColor;
  @override
  final Color wonDotColor;

  const GameTheme({
    required this.backgroundColor,
    required this.cellColor,
    required this.cellPressedColor,
    required this.cpuDotColor,
    required this.drawnDotColor,
    required this.gridColor,
    required this.labelStyle,
    required this.lostDotColor,
    required this.markCpuColor,
    required this.markOutlineColor,
    required this.markPlayerColor,
    required this.pressedDotColor,
    required this.sentenceStyle,
    required this.turnDotColor,
    required this.warningColor,
    required this.warningStyle,
    required this.winLineColor,
    required this.wonDotColor,
  });
}
