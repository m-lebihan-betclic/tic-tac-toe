import 'package:design_tokens/design_tokens.dart';
import 'package:exceptions/exceptions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_di.br.g.dart';

/// The active palette. Composition feeds it from the player's theme preference, so switching
/// theme repaints every feature without a feature knowing a preference exists.
@riverpod
AppPalette appPalette(Ref ref) {
  throw UnregisteredProviderException(appPaletteProvider);
}

/// The active type scale. Matrix swaps the sans family for the platform monospace, so this
/// changes with the theme too.
@riverpod
AppTypography appTypography(Ref ref) {
  throw UnregisteredProviderException(appTypographyProvider);
}
