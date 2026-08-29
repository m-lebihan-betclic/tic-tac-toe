import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part '{{classname.snakeCase()}}_theme.br.tailor.dart';

@TailorMixinComponent()
class {{classname.pascalCase()}}Theme extends ThemeExtension<{{classname.pascalCase()}}Theme>
    with _${{classname.pascalCase()}}ThemeTailorMixin {
  @override
  final Color backgroundColor;

  const {{classname.pascalCase()}}Theme({required this.backgroundColor});
}
