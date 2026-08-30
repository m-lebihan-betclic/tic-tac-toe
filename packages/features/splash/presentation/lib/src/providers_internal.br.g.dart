// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feature's default theme, derived from the design-system tokens. This is the only place
/// in the feature that reads the palette or the type scale: everything else reads
/// `splashThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.

@ProviderFor(defaultSplashTheme)
final defaultSplashThemeProvider = DefaultSplashThemeProvider._();

/// The feature's default theme, derived from the design-system tokens. This is the only place
/// in the feature that reads the palette or the type scale: everything else reads
/// `splashThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.

final class DefaultSplashThemeProvider
    extends $FunctionalProvider<SplashTheme, SplashTheme, SplashTheme>
    with $Provider<SplashTheme> {
  /// The feature's default theme, derived from the design-system tokens. This is the only place
  /// in the feature that reads the palette or the type scale: everything else reads
  /// `splashThemeProvider`.
  ///
  /// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
  /// changing a line.
  DefaultSplashThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultSplashThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultSplashThemeHash();

  @$internal
  @override
  $ProviderElement<SplashTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashTheme create(Ref ref) {
    return defaultSplashTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashTheme>(value),
    );
  }
}

String _$defaultSplashThemeHash() =>
    r'984b56cf0bcfb13d1cce53fc444fac3462df6031';
