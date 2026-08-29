// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SplashThemeTailorMixin on ThemeExtension<SplashTheme> {
  Color get backgroundColor;
  Color get dotColor;
  Color get markCpuColor;
  Color get markOutlineColor;
  Color get markPlayerColor;
  TextStyle get taglineStyle;
  TextStyle get wordmarkStyle;

  @override
  SplashTheme copyWith({
    Color? backgroundColor,
    Color? dotColor,
    Color? markCpuColor,
    Color? markOutlineColor,
    Color? markPlayerColor,
    TextStyle? taglineStyle,
    TextStyle? wordmarkStyle,
  }) {
    return SplashTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      dotColor: dotColor ?? this.dotColor,
      markCpuColor: markCpuColor ?? this.markCpuColor,
      markOutlineColor: markOutlineColor ?? this.markOutlineColor,
      markPlayerColor: markPlayerColor ?? this.markPlayerColor,
      taglineStyle: taglineStyle ?? this.taglineStyle,
      wordmarkStyle: wordmarkStyle ?? this.wordmarkStyle,
    );
  }

  @override
  SplashTheme lerp(covariant ThemeExtension<SplashTheme>? other, double t) {
    if (other is! SplashTheme) return this as SplashTheme;
    return SplashTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      dotColor: Color.lerp(dotColor, other.dotColor, t)!,
      markCpuColor: Color.lerp(markCpuColor, other.markCpuColor, t)!,
      markOutlineColor: Color.lerp(
        markOutlineColor,
        other.markOutlineColor,
        t,
      )!,
      markPlayerColor: Color.lerp(markPlayerColor, other.markPlayerColor, t)!,
      taglineStyle: TextStyle.lerp(taglineStyle, other.taglineStyle, t)!,
      wordmarkStyle: TextStyle.lerp(wordmarkStyle, other.wordmarkStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashTheme &&
            const DeepCollectionEquality().equals(
              backgroundColor,
              other.backgroundColor,
            ) &&
            const DeepCollectionEquality().equals(dotColor, other.dotColor) &&
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
              taglineStyle,
              other.taglineStyle,
            ) &&
            const DeepCollectionEquality().equals(
              wordmarkStyle,
              other.wordmarkStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(backgroundColor),
      const DeepCollectionEquality().hash(dotColor),
      const DeepCollectionEquality().hash(markCpuColor),
      const DeepCollectionEquality().hash(markOutlineColor),
      const DeepCollectionEquality().hash(markPlayerColor),
      const DeepCollectionEquality().hash(taglineStyle),
      const DeepCollectionEquality().hash(wordmarkStyle),
    );
  }
}
