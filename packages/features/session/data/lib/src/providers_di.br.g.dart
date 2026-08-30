// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyDISessionData)
final dummyDISessionDataProvider = DummyDISessionDataProvider._();

final class DummyDISessionDataProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyDISessionDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyDISessionDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyDISessionDataHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyDISessionData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyDISessionDataHash() =>
    r'52b40c1baaac81d2692755bf5517b83f83a210ab';
