// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_theme.br.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$SetupThemeTailorMixin on ThemeExtension<SetupTheme> {
  Color get counterColor;
  Color get counterFullColor;
  Color get fieldBorderColor;
  Color get fieldFocusedBorderColor;
  Color get fieldFillColor;
  TextStyle get fieldStyle;
  Color get handleColor;
  TextStyle get labelStyle;
  Color get sheetColor;
  TextStyle get subtitleStyle;
  TextStyle get titleStyle;

  @override
  SetupTheme copyWith({
    Color? counterColor,
    Color? counterFullColor,
    Color? fieldBorderColor,
    Color? fieldFocusedBorderColor,
    Color? fieldFillColor,
    TextStyle? fieldStyle,
    Color? handleColor,
    TextStyle? labelStyle,
    Color? sheetColor,
    TextStyle? subtitleStyle,
    TextStyle? titleStyle,
  }) {
    return SetupTheme(
      counterColor: counterColor ?? this.counterColor,
      counterFullColor: counterFullColor ?? this.counterFullColor,
      fieldBorderColor: fieldBorderColor ?? this.fieldBorderColor,
      fieldFocusedBorderColor:
          fieldFocusedBorderColor ?? this.fieldFocusedBorderColor,
      fieldFillColor: fieldFillColor ?? this.fieldFillColor,
      fieldStyle: fieldStyle ?? this.fieldStyle,
      handleColor: handleColor ?? this.handleColor,
      labelStyle: labelStyle ?? this.labelStyle,
      sheetColor: sheetColor ?? this.sheetColor,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      titleStyle: titleStyle ?? this.titleStyle,
    );
  }

  @override
  SetupTheme lerp(covariant ThemeExtension<SetupTheme>? other, double t) {
    if (other is! SetupTheme) return this as SetupTheme;
    return SetupTheme(
      counterColor: Color.lerp(counterColor, other.counterColor, t)!,
      counterFullColor: Color.lerp(
        counterFullColor,
        other.counterFullColor,
        t,
      )!,
      fieldBorderColor: Color.lerp(
        fieldBorderColor,
        other.fieldBorderColor,
        t,
      )!,
      fieldFocusedBorderColor: Color.lerp(
        fieldFocusedBorderColor,
        other.fieldFocusedBorderColor,
        t,
      )!,
      fieldFillColor: Color.lerp(fieldFillColor, other.fieldFillColor, t)!,
      fieldStyle: TextStyle.lerp(fieldStyle, other.fieldStyle, t)!,
      handleColor: Color.lerp(handleColor, other.handleColor, t)!,
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      sheetColor: Color.lerp(sheetColor, other.sheetColor, t)!,
      subtitleStyle: TextStyle.lerp(subtitleStyle, other.subtitleStyle, t)!,
      titleStyle: TextStyle.lerp(titleStyle, other.titleStyle, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SetupTheme &&
            const DeepCollectionEquality().equals(
              counterColor,
              other.counterColor,
            ) &&
            const DeepCollectionEquality().equals(
              counterFullColor,
              other.counterFullColor,
            ) &&
            const DeepCollectionEquality().equals(
              fieldBorderColor,
              other.fieldBorderColor,
            ) &&
            const DeepCollectionEquality().equals(
              fieldFocusedBorderColor,
              other.fieldFocusedBorderColor,
            ) &&
            const DeepCollectionEquality().equals(
              fieldFillColor,
              other.fieldFillColor,
            ) &&
            const DeepCollectionEquality().equals(
              fieldStyle,
              other.fieldStyle,
            ) &&
            const DeepCollectionEquality().equals(
              handleColor,
              other.handleColor,
            ) &&
            const DeepCollectionEquality().equals(
              labelStyle,
              other.labelStyle,
            ) &&
            const DeepCollectionEquality().equals(
              sheetColor,
              other.sheetColor,
            ) &&
            const DeepCollectionEquality().equals(
              subtitleStyle,
              other.subtitleStyle,
            ) &&
            const DeepCollectionEquality().equals(
              titleStyle,
              other.titleStyle,
            ));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(counterColor),
      const DeepCollectionEquality().hash(counterFullColor),
      const DeepCollectionEquality().hash(fieldBorderColor),
      const DeepCollectionEquality().hash(fieldFocusedBorderColor),
      const DeepCollectionEquality().hash(fieldFillColor),
      const DeepCollectionEquality().hash(fieldStyle),
      const DeepCollectionEquality().hash(handleColor),
      const DeepCollectionEquality().hash(labelStyle),
      const DeepCollectionEquality().hash(sheetColor),
      const DeepCollectionEquality().hash(subtitleStyle),
      const DeepCollectionEquality().hash(titleStyle),
    );
  }
}
