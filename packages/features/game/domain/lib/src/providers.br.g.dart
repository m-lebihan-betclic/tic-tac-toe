// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playMove)
final playMoveProvider = PlayMoveProvider._();

final class PlayMoveProvider
    extends $FunctionalProvider<PlayMoveFun, PlayMoveFun, PlayMoveFun>
    with $Provider<PlayMoveFun> {
  PlayMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playMoveHash();

  @$internal
  @override
  $ProviderElement<PlayMoveFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayMoveFun create(Ref ref) {
    return playMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayMoveFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayMoveFun>(value),
    );
  }
}

String _$playMoveHash() => r'a5828e8c6c502f20cf604829b8ee98c6e57cf9de';

@ProviderFor(resetRound)
final resetRoundProvider = ResetRoundProvider._();

final class ResetRoundProvider
    extends $FunctionalProvider<ResetRoundFun, ResetRoundFun, ResetRoundFun>
    with $Provider<ResetRoundFun> {
  ResetRoundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resetRoundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resetRoundHash();

  @$internal
  @override
  $ProviderElement<ResetRoundFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ResetRoundFun create(Ref ref) {
    return resetRound(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResetRoundFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResetRoundFun>(value),
    );
  }
}

String _$resetRoundHash() => r'd6c4d8df9ef70f653bd09ee74357b71fc509af9f';

@ProviderFor(startRound)
final startRoundProvider = StartRoundProvider._();

final class StartRoundProvider
    extends $FunctionalProvider<StartRoundFun, StartRoundFun, StartRoundFun>
    with $Provider<StartRoundFun> {
  StartRoundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'startRoundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$startRoundHash();

  @$internal
  @override
  $ProviderElement<StartRoundFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StartRoundFun create(Ref ref) {
    return startRound(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StartRoundFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StartRoundFun>(value),
    );
  }
}

String _$startRoundHash() => r'9065c8d8af90a3e301715fae8584a05be3d927d4';
