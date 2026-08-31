// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Required: throws until composition feeds it.

@ProviderFor(historyRouting)
final historyRoutingProvider = HistoryRoutingProvider._();

/// Required: throws until composition feeds it.

final class HistoryRoutingProvider
    extends $FunctionalProvider<HistoryRouting, HistoryRouting, HistoryRouting>
    with $Provider<HistoryRouting> {
  /// Required: throws until composition feeds it.
  HistoryRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyRoutingHash();

  @$internal
  @override
  $ProviderElement<HistoryRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HistoryRouting create(Ref ref) {
    return historyRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryRouting>(value),
    );
  }
}

String _$historyRoutingHash() => r'6342ab51cdfefa302d969fa2153d8d81ce68a4c9';

/// Optional: proxies the in-package default, so the feature renders with or without one.

@ProviderFor(historyTheme)
final historyThemeProvider = HistoryThemeProvider._();

/// Optional: proxies the in-package default, so the feature renders with or without one.

final class HistoryThemeProvider
    extends $FunctionalProvider<HistoryTheme, HistoryTheme, HistoryTheme>
    with $Provider<HistoryTheme> {
  /// Optional: proxies the in-package default, so the feature renders with or without one.
  HistoryThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'historyThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$historyThemeHash();

  @$internal
  @override
  $ProviderElement<HistoryTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HistoryTheme create(Ref ref) {
    return historyTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryTheme>(value),
    );
  }
}

String _$historyThemeHash() => r'2c221fac1d4a13fea8dbb018699b8a9eba4cb298';
