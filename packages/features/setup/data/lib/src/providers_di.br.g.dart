// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dummyDISetupData)
final dummyDISetupDataProvider = DummyDISetupDataProvider._();

final class DummyDISetupDataProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  DummyDISetupDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dummyDISetupDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dummyDISetupDataHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return dummyDISetupData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dummyDISetupDataHash() => r'40a2da00881739521d8000f3ed2cd9ea8055de2f';
