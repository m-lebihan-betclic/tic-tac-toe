import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'history_theme.br.tailor.dart';

/// Every colour and type style the history screen draws with, already resolved.
///
/// The three stat accents are fields rather than one colour and a switch, because which outcome
/// gets which accent is a design decision and this is where the design lives.
@TailorMixinComponent()
class HistoryTheme extends ThemeExtension<HistoryTheme> with _$HistoryThemeTailorMixin {
  @override
  final Color backgroundColor;
  @override
  final Color closeGlyphColor;
  @override
  final Color drawnAccent;
  @override
  final TextStyle emptyStyle;
  @override
  final TextStyle indexStyle;
  @override
  final TextStyle labelStyle;
  @override
  final Color lostAccent;
  @override
  final TextStyle noteStyle;
  @override
  final TextStyle roundStyle;
  @override
  final TextStyle statValueStyle;
  @override
  final TextStyle titleStyle;
  @override
  final Color wonAccent;

  /// What a counter is worth before anything has happened. The app's rule everywhere numbers
  /// appear: a zero recedes, because nothing has happened yet.
  @override
  final Color zeroAccent;

  const HistoryTheme({
    required this.backgroundColor,
    required this.closeGlyphColor,
    required this.drawnAccent,
    required this.emptyStyle,
    required this.indexStyle,
    required this.labelStyle,
    required this.lostAccent,
    required this.noteStyle,
    required this.roundStyle,
    required this.statValueStyle,
    required this.titleStyle,
    required this.wonAccent,
    required this.zeroAccent,
  });
}
