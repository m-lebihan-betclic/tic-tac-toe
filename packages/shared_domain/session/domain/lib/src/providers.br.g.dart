// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummySessionDomain)
final dummySessionDomainProvider = DummySessionDomainProvider._();

final class DummySessionDomainProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummySessionDomainProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummySessionDomainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummySessionDomainHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummySessionDomain(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummySessionDomainHash() =>
    r'89b70e91349e50b81e203c9f459ce2b449cb7f51';
