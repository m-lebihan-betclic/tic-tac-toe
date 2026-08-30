// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Required: throws until composition feeds it.

@ProviderFor(setupRouting)
final setupRoutingProvider = SetupRoutingProvider._();

/// Required: throws until composition feeds it.

final class SetupRoutingProvider
    extends $FunctionalProvider<SetupRouting, SetupRouting, SetupRouting>
    with $Provider<SetupRouting> {
  /// Required: throws until composition feeds it.
  SetupRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setupRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setupRoutingHash();

  @$internal
  @override
  $ProviderElement<SetupRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SetupRouting create(Ref ref) {
    return setupRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetupRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetupRouting>(value),
    );
  }
}

String _$setupRoutingHash() => r'3dcb0fdcb2f2e99429a7a25a48759860eb2083ab';

/// Optional: proxies the in-package default, so the feature renders with or without one.

@ProviderFor(setupTheme)
final setupThemeProvider = SetupThemeProvider._();

/// Optional: proxies the in-package default, so the feature renders with or without one.

final class SetupThemeProvider
    extends $FunctionalProvider<SetupTheme, SetupTheme, SetupTheme>
    with $Provider<SetupTheme> {
  /// Optional: proxies the in-package default, so the feature renders with or without one.
  SetupThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setupThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setupThemeHash();

  @$internal
  @override
  $ProviderElement<SetupTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SetupTheme create(Ref ref) {
    return setupTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetupTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetupTheme>(value),
    );
  }
}

String _$setupThemeHash() => r'e00cd6ce2ad293ec500172f40c68f8874b634f79';
