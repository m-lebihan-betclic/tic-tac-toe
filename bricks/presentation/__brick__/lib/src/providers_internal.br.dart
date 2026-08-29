import 'package:design_providers/design_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:{{name.snakeCase()}}/src/theme/{{classname.snakeCase()}}_theme.br.dart';

part 'providers_internal.br.g.dart';

/// The feature's default theme, derived from the design-system tokens. This is the only place
/// in the feature that reads the palette or the type scale: everything else reads
/// `{{classname.camelCase()}}ThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.
@riverpod
{{classname.pascalCase()}}Theme default{{classname.pascalCase()}}Theme(Ref ref) {
  final palette = ref.watch(appPaletteProvider);

  return {{classname.pascalCase()}}Theme(backgroundColor: palette.background);
}
