// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$GameThemeTailorMixin on ThemeExtension<GameTheme> {
  Color get backgroundColor;
  Color get cellColor;
  Color get cellPressedColor;
  Color get cpuDotColor;
  Color get drawnDotColor;
  Color get gridColor;
  TextStyle get labelStyle;
  Color get lostDotColor;
  Color get markCpuColor;
  Color get markOutlineColor;
  Color get markPlayerColor;
  Color get pressedDotColor;
  TextStyle get sentenceStyle;
  Color get turnDotColor;
  Color get warningColor;
  TextStyle get warningStyle;
  Color get winLineColor;
  Color get wonDotColor;

  @override
  GameTheme copyWith({
    Color? backgroundColor,
    Color? cellColor,
    Color? cellPressedColor,
    Color? cpuDotColor,
    Color? drawnDotColor,
    Color? gridColor,
    TextStyle? labelStyle,
    Color? lostDotColor,
    Color? markCpuColor,
    Color? markOutlineColor,
    Color? markPlayerColor,
    Color? pressedDotColor,
    TextStyle? sentenceStyle,
    Color? turnDotColor,
    Color? warningColor,
    TextStyle? warningStyle,
    Color? winLineColor,
    Color? wonDotColor,
  }) {
    return GameTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cellColor: cellColor ?? this.cellColor,
      cellPressedColor: cellPressedColor ?? this.cellPressedColor,
      cpuDotColor: cpuDotColor ?? this.cpuDotColor,
      drawnDotColor: drawnDotColor ?? this.drawnDotColor,
      gridColor: gridColor ?? this.gridColor,
      labelStyle: labelStyle ?? this.labelStyle,
      lostDotColor: lostDotColor ?? this.lostDotColor,
      markCpuColor: markCpuColor ?? this.markCpuColor,
      markOutlineColor: markOutlineColor ?? this.markOutlineColor,
      markPlayerColor: markPlayerColor ?? this.markPlayerColor,
      pressedDotColor: pressedDotColor ?? this.pressedDotColor,
      sentenceStyle: sentenceStyle ?? this.sentenceStyle,
      turnDotColor: turnDotColor ?? this.turnDotColor,
      warningColor: warningColor ?? this.warningColor,
      warningStyle: warningStyle ?? this.warningStyle,
      winLineColor: winLineColor ?? this.winLineColor,
      wonDotColor: wonDotColor ?? this.wonDotColor,
    );
  }

  @override
  GameTheme lerp(covariant ThemeExtension<GameTheme>? other, double t) {
    if (other is! GameTheme) return this as GameTheme;
    return GameTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      cellColor: Color.lerp(cellColor, other.cellColor, t)!,
      cellPressedColor: Color.lerp(
        cellPressedColor,
        other.cellPressedColor,
        t,
      )!,
      cpuDotColor: Color.lerp(cpuDotColor, other.cpuDotColor, t)!,
      drawnDotColor: Color.lerp(drawnDotColor, other.drawnDotColor, t)!,
      gridColor: Color.lerp(gridColor, other.gridColor, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      lostDotColor: Color.lerp(lostDotColor, other.lostDotColor, t)!,
      markCpuColor: Color.lerp(markCpuColor, other.markCpuColor, t)!,
      markOutlineColor: Color.lerp(
        markOutlineColor,
        other.markOutlineColor,
        t,
      )!,
      markPlayerColor: Color.lerp(markPlayerColor, other.markPlayerColor, t)!,
      pressedDotColor: Color.lerp(pressedDotColor, other.pressedDotColor, t)!,
      sentenceStyle: TextStyle.lerp(sentenceStyle, other.sentenceStyle, t)!,
      turnDotColor: Color.lerp(turnDotColor, other.turnDotColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      warningStyle: TextStyle.lerp(warningStyle, other.warningStyle, t)!,
      winLineColor: Color.lerp(winLineColor, other.winLineColor, t)!,
      wonDotColor: Color.lerp(wonDotColor, other.wonDotColor, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GameTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(cellColor, other.cellColor) &&
            const DeepCollectionEquality().equals(
              cellPressedColor,
              other.cellPressedColor,
            ) &&
            const DeepCollectionEquality().equals(
              cpuDotColor,
              other.cpuDotColor,
            ) &&
            const DeepCollectionEquality().equals(
              drawnDotColor,
              other.drawnDotColor,
            ) &&
            const DeepCollectionEquality().equals(gridColor, other.gridColor) &&
            const DeepCollectionEquality().equals(
              labelStyle,
              other.labelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              lostDotColor,
              other.lostDotColor,
            ) &&
            const DeepCollectionEquality().equals(
              markCpuColor,
              other.markCpuColor,
            ) &&
            const DeepCollectionEquality().equals(
              markOutlineColor,
              other.markOutlineColor,
            ) &&
            const DeepCollectionEquality().equals(
              markPlayerColor,
              other.markPlayerColor,
            ) &&
            const DeepCollectionEquality().equals(
              pressedDotColor,
              other.pressedDotColor,
            ) &&
            const DeepCollectionEquality().equals(
              sentenceStyle,
              other.sentenceStyle,
            ) &&
            const DeepCollectionEquality().equals(
              turnDotColor,
              other.turnDotColor,
            ) &&
            const DeepCollectionEquality().equals(
              warningColor,
              other.warningColor,
            ) &&
            const DeepCollectionEquality().equals(
              warningStyle,
              other.warningStyle,
            ) &&
            const DeepCollectionEquality().equals(
              winLineColor,
              other.winLineColor,
            ) &&
            const DeepCollectionEquality().equals(
              wonDotColor,
              other.wonDotColor,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(cellColor),
      const DeepCollectionEquality().hash(cellPressedColor),
      const DeepCollectionEquality().hash(cpuDotColor),
      const DeepCollectionEquality().hash(drawnDotColor),
      const DeepCollectionEquality().hash(gridColor),
      const DeepCollectionEquality().hash(labelStyle),
      const DeepCollectionEquality().hash(lostDotColor),
      const DeepCollectionEquality().hash(markCpuColor),
      const DeepCollectionEquality().hash(markOutlineColor),
      const DeepCollectionEquality().hash(markPlayerColor),
      const DeepCollectionEquality().hash(pressedDotColor),
      const DeepCollectionEquality().hash(sentenceStyle),
      const DeepCollectionEquality().hash(turnDotColor),
      const DeepCollectionEquality().hash(warningColor),
      const DeepCollectionEquality().hash(warningStyle),
      const DeepCollectionEquality().hash(winLineColor),
      const DeepCollectionEquality().hash(wonDotColor),
    );
  }
}
