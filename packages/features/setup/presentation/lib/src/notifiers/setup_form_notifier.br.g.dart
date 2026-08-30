// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_form_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds what the sheet has been told so far, and writes it through the contracts on submit.
///
/// Theme is the exception: it is written as it is chosen, because the sheet previews the choice
/// by repainting itself, and previewing means the app already has to be wearing it.

@ProviderFor(SetupFormNotifier)
final setupFormProvider = SetupFormNotifierProvider._();

/// Holds what the sheet has been told so far, and writes it through the contracts on submit.
///
/// Theme is the exception: it is written as it is chosen, because the sheet previews the choice
/// by repainting itself, and previewing means the app already has to be wearing it.
final class SetupFormNotifierProvider
    extends $NotifierProvider<SetupFormNotifier, SetupFormState> {
  /// Holds what the sheet has been told so far, and writes it through the contracts on submit.
  ///
  /// Theme is the exception: it is written as it is chosen, because the sheet previews the choice
  /// by repainting itself, and previewing means the app already has to be wearing it.
  SetupFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setupFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setupFormNotifierHash();

  @$internal
  @override
  SetupFormNotifier create() => SetupFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetupFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetupFormState>(value),
    );
  }
}

String _$setupFormNotifierHash() => r'e5cea105d0726d4c72545bc9509dc60471c7de2c';

/// Holds what the sheet has been told so far, and writes it through the contracts on submit.
///
/// Theme is the exception: it is written as it is chosen, because the sheet previews the choice
/// by repainting itself, and previewing means the app already has to be wearing it.

abstract class _$SetupFormNotifier extends $Notifier<SetupFormState> {
  SetupFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SetupFormState, SetupFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SetupFormState, SetupFormState>,
              SetupFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
