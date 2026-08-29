import 'package:design_providers/src/providers_di.br.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> bindProviders({
  required ProviderListenable<AppPalette> palette,
  required ProviderListenable<AppTypography> typography,
}) => [
  appPaletteProvider.overrideWith((ref) => ref.watch(palette)),
  appTypographyProvider.overrideWith((ref) => ref.watch(typography)),
];
