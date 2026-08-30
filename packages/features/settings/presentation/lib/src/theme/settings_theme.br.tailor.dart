// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SettingsThemeTailorMixin on ThemeExtension<SettingsTheme> {
  Color get backgroundColor;
  Color get closeGlyphColor;
  Color get cursorColor;
  TextStyle get labelStyle;
  TextStyle get linkStyle;
  TextStyle get nameStyle;
  TextStyle get noteStyle;
  TextStyle get titleStyle;

  @override
  SettingsTheme copyWith({
    Color? backgroundColor,
    Color? closeGlyphColor,
    Color? cursorColor,
    TextStyle? labelStyle,
    TextStyle? linkStyle,
    TextStyle? nameStyle,
    TextStyle? noteStyle,
    TextStyle? titleStyle,
  }) {
    return SettingsTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      closeGlyphColor: closeGlyphColor ?? this.closeGlyphColor,
      cursorColor: cursorColor ?? this.cursorColor,
      labelStyle: labelStyle ?? this.labelStyle,
      linkStyle: linkStyle ?? this.linkStyle,
      nameStyle: nameStyle ?? this.nameStyle,
      noteStyle: noteStyle ?? this.noteStyle,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  SettingsTheme lerp(covariant ThemeExtension<SettingsTheme>? other, double t) {
    if (other is! SettingsTheme) return this as SettingsTheme;
    return SettingsTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      closeGlyphColor: Color.lerp(closeGlyphColor, other.closeGlyphColor, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      linkStyle: TextStyle.lerp(linkStyle, other.linkStyle, t)!,
      nameStyle: TextStyle.lerp(nameStyle, other.nameStyle, t)!,
      noteStyle: TextStyle.lerp(noteStyle, other.noteStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(
              closeGlyphColor,
              other.closeGlyphColor,
            ) &&
            const DeepCollectionEquality().equals(
              cursorColor,
              other.cursorColor,
            ) &&
            const DeepCollectionEquality().equals(
              labelStyle,
              other.labelStyle,
            ) &&
            const DeepCollectionEquality().equals(linkStyle, other.linkStyle) &&
            const DeepCollectionEquality().equals(nameStyle, other.nameStyle) &&
            const DeepCollectionEquality().equals(noteStyle, other.noteStyle) &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(closeGlyphColor),
      const DeepCollectionEquality().hash(cursorColor),
      const DeepCollectionEquality().hash(labelStyle),
      const DeepCollectionEquality().hash(linkStyle),
      const DeepCollectionEquality().hash(nameStyle),
      const DeepCollectionEquality().hash(noteStyle),
      const DeepCollectionEquality().hash(titleStyle),
    );
  }
}
