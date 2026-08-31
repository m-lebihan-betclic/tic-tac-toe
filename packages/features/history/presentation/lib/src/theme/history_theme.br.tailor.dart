// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$HistoryThemeTailorMixin on ThemeExtension<HistoryTheme> {
  Color get backgroundColor;
  Color get closeGlyphColor;
  Color get drawnAccent;
  TextStyle get emptyStyle;
  TextStyle get indexStyle;
  TextStyle get labelStyle;
  Color get lostAccent;
  TextStyle get noteStyle;
  TextStyle get roundStyle;
  TextStyle get statValueStyle;
  TextStyle get titleStyle;
  Color get wonAccent;
  Color get zeroAccent;

  @override
  HistoryTheme copyWith({
    Color? backgroundColor,
    Color? closeGlyphColor,
    Color? drawnAccent,
    TextStyle? emptyStyle,
    TextStyle? indexStyle,
    TextStyle? labelStyle,
    Color? lostAccent,
    TextStyle? noteStyle,
    TextStyle? roundStyle,
    TextStyle? statValueStyle,
    TextStyle? titleStyle,
    Color? wonAccent,
    Color? zeroAccent,
  }) {
    return HistoryTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      closeGlyphColor: closeGlyphColor ?? this.closeGlyphColor,
      drawnAccent: drawnAccent ?? this.drawnAccent,
      emptyStyle: emptyStyle ?? this.emptyStyle,
      indexStyle: indexStyle ?? this.indexStyle,
      labelStyle: labelStyle ?? this.labelStyle,
      lostAccent: lostAccent ?? this.lostAccent,
      noteStyle: noteStyle ?? this.noteStyle,
      roundStyle: roundStyle ?? this.roundStyle,
      statValueStyle: statValueStyle ?? this.statValueStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      wonAccent: wonAccent ?? this.wonAccent,
      zeroAccent: zeroAccent ?? this.zeroAccent,
    );
  }

  @override
  HistoryTheme lerp(covariant ThemeExtension<HistoryTheme>? other, double t) {
    if (other is! HistoryTheme) return this as HistoryTheme;
    return HistoryTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      closeGlyphColor: Color.lerp(closeGlyphColor, other.closeGlyphColor, t)!,
      drawnAccent: Color.lerp(drawnAccent, other.drawnAccent, t)!,
      emptyStyle: TextStyle.lerp(emptyStyle, other.emptyStyle, t)!,
      indexStyle: TextStyle.lerp(indexStyle, other.indexStyle, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      lostAccent: Color.lerp(lostAccent, other.lostAccent, t)!,
      noteStyle: TextStyle.lerp(noteStyle, other.noteStyle, t)!,
      roundStyle: TextStyle.lerp(roundStyle, other.roundStyle, t)!,
      statValueStyle: TextStyle.lerp(statValueStyle, other.statValueStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
      wonAccent: Color.lerp(wonAccent, other.wonAccent, t)!,
      zeroAccent: Color.lerp(zeroAccent, other.zeroAccent, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HistoryTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              closeGlyphColor,
              other.closeGlyphColor,
            ) &&
            const DeepCollectionEquality().equals(
              drawnAccent,
              other.drawnAccent,
            ) &&
            const DeepCollectionEquality().equals(
              emptyStyle,
              other.emptyStyle,
            ) &&
            const DeepCollectionEquality().equals(
              indexStyle,
              other.indexStyle,
            ) &&
            const DeepCollectionEquality().equals(
              labelStyle,
              other.labelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              lostAccent,
              other.lostAccent,
            ) &&
            const DeepCollectionEquality().equals(noteStyle, other.noteStyle) &&
            const DeepCollectionEquality().equals(
              roundStyle,
              other.roundStyle,
            ) &&
            const DeepCollectionEquality().equals(
              statValueStyle,
              other.statValueStyle,
            ) &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
            ) &&
            const DeepCollectionEquality().equals(wonAccent, other.wonAccent) &&
            const DeepCollectionEquality().equals(
              zeroAccent,
              other.zeroAccent,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(closeGlyphColor),
      const DeepCollectionEquality().hash(drawnAccent),
      const DeepCollectionEquality().hash(emptyStyle),
      const DeepCollectionEquality().hash(indexStyle),
      const DeepCollectionEquality().hash(labelStyle),
      const DeepCollectionEquality().hash(lostAccent),
      const DeepCollectionEquality().hash(noteStyle),
      const DeepCollectionEquality().hash(roundStyle),
      const DeepCollectionEquality().hash(statValueStyle),
      const DeepCollectionEquality().hash(titleStyle),
      const DeepCollectionEquality().hash(wonAccent),
      const DeepCollectionEquality().hash(zeroAccent),
    );
  }
}
