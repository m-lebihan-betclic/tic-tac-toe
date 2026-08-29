// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The active palette. Composition feeds it from the player's theme preference, so switching
/// theme repaints every feature without a feature knowing a preference exists.

@ProviderFor(appPalette)
final appPaletteProvider = AppPaletteProvider._();

/// The active palette. Composition feeds it from the player's theme preference, so switching
/// theme repaints every feature without a feature knowing a preference exists.

final class AppPaletteProvider
    extends $FunctionalProvider<AppPalette, AppPalette, AppPalette>
    with $Provider<AppPalette> {
  /// The active palette. Composition feeds it from the player's theme preference, so switching
  /// theme repaints every feature without a feature knowing a preference exists.
  AppPaletteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appPaletteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appPaletteHash();

  @$internal
  @override
  $ProviderElement<AppPalette> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppPalette create(Ref ref) {
    return appPalette(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppPalette value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppPalette>(value),
    );
  }
}

String _$appPaletteHash() => r'6f05514100aee4d8a1772039bb2b6910ce65ee02';

/// The active type scale. Matrix swaps the sans family for the platform monospace, so this
/// changes with the theme too.

@ProviderFor(appTypography)
final appTypographyProvider = AppTypographyProvider._();

/// The active type scale. Matrix swaps the sans family for the platform monospace, so this
/// changes with the theme too.

final class AppTypographyProvider
    extends $FunctionalProvider<AppTypography, AppTypography, AppTypography>
    with $Provider<AppTypography> {
  /// The active type scale. Matrix swaps the sans family for the platform monospace, so this
  /// changes with the theme too.
  AppTypographyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appTypographyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appTypographyHash();

  @$internal
  @override
  $ProviderElement<AppTypography> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppTypography create(Ref ref) {
    return appTypography(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTypography value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTypography>(value),
    );
  }
}

String _$appTypographyHash() => r'baf9f52a7d49b131d198c71cf40981bad67b45bb';
