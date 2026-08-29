// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyInternalSessionDomain)
final dummyInternalSessionDomainProvider =
    DummyInternalSessionDomainProvider._();

final class DummyInternalSessionDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyInternalSessionDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyInternalSessionDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyInternalSessionDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyInternalSessionDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyInternalSessionDomainHash() =>
    r'11813dae422248dce235f731cd51a405caaa18c0';
