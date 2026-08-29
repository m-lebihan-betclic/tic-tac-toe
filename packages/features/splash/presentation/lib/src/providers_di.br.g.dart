// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Required: throws until composition feeds it.

@ProviderFor(splashRouting)
final splashRoutingProvider = SplashRoutingProvider._();

/// Required: throws until composition feeds it.

final class SplashRoutingProvider
    extends $FunctionalProvider<SplashRouting, SplashRouting, SplashRouting>
    with $Provider<SplashRouting> {
  /// Required: throws until composition feeds it.
  SplashRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashRoutingHash();

  @$internal
  @override
  $ProviderElement<SplashRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashRouting create(Ref ref) {
    return splashRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashRouting>(value),
    );
  }
}

String _$splashRoutingHash() => r'f402955b228d44a80da5b969f4e79e6a959a2398';

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.

@ProviderFor(splashTheme)
final splashThemeProvider = SplashThemeProvider._();

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.

final class SplashThemeProvider
    extends $FunctionalProvider<SplashTheme, SplashTheme, SplashTheme>
    with $Provider<SplashTheme> {
  /// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
  /// feature renders correctly whether or not composition passes a theme.
  SplashThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashThemeHash();

  @$internal
  @override
  $ProviderElement<SplashTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashTheme create(Ref ref) {
    return splashTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashTheme>(value),
    );
  }
}

String _$splashThemeHash() => r'5d7c65de01fbcc326f5c04d8644732c5e8942591';
