// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.

@ProviderFor(defaultSetupTheme)
final defaultSetupThemeProvider = DefaultSetupThemeProvider._();

/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.

final class DefaultSetupThemeProvider
    extends $FunctionalProvider<SetupTheme, SetupTheme, SetupTheme>
    with $Provider<SetupTheme> {
  /// The feature's default theme, derived from the design-system tokens. The only place in the
  /// feature that reads the palette or the type scale.
  DefaultSetupThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultSetupThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultSetupThemeHash();

  @$internal
  @override
  $ProviderElement<SetupTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SetupTheme create(Ref ref) {
    return defaultSetupTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetupTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetupTheme>(value),
    );
  }
}

String _$defaultSetupThemeHash() => r'a55814243172f0e88da2c0993a4a9d10696c64dc';
