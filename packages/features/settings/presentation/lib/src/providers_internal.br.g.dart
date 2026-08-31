// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.

@ProviderFor(defaultSettingsTheme)
final defaultSettingsThemeProvider = DefaultSettingsThemeProvider._();

/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.

final class DefaultSettingsThemeProvider
    extends $FunctionalProvider<SettingsTheme, SettingsTheme, SettingsTheme>
    with $Provider<SettingsTheme> {
  /// The feature's default theme, derived from the design-system tokens. The only place in the
  /// feature that reads the palette or the type scale.
  DefaultSettingsThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultSettingsThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultSettingsThemeHash();

  @$internal
  @override
  $ProviderElement<SettingsTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsTheme create(Ref ref) {
    return defaultSettingsTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsTheme>(value),
    );
  }
}

String _$defaultSettingsThemeHash() =>
    r'8195e277aea8ea2f396aa71fdb45c6022be09c18';
