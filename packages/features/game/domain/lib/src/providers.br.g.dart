// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The seeded seam. A test overrides this provider to make the easy CPU's random choice
/// repeatable; nothing else has a reason to.

@ProviderFor(cpuRandom)
final cpuRandomProvider = CpuRandomProvider._();

/// The seeded seam. A test overrides this provider to make the easy CPU's random choice
/// repeatable; nothing else has a reason to.

final class CpuRandomProvider
    extends $FunctionalProvider<Random, Random, Random>
    with $Provider<Random> {
  /// The seeded seam. A test overrides this provider to make the easy CPU's random choice
  /// repeatable; nothing else has a reason to.
  CpuRandomProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cpuRandomProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cpuRandomHash();

  @$internal
  @override
  $ProviderElement<Random> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Random create(Ref ref) {
    return cpuRandom(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Random value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Random>(value),
    );
  }
}

String _$cpuRandomHash() => r'9b4bc1a1c8d89f454976256dca5f95d293636be1';

@ProviderFor(playCpuMove)
final playCpuMoveProvider = PlayCpuMoveProvider._();

final class PlayCpuMoveProvider
    extends $FunctionalProvider<PlayCpuMoveFun, PlayCpuMoveFun, PlayCpuMoveFun>
    with $Provider<PlayCpuMoveFun> {
  PlayCpuMoveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playCpuMoveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playCpuMoveHash();

  @$internal
  @override
  $ProviderElement<PlayCpuMoveFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayCpuMoveFun create(Ref ref) {
    return playCpuMove(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayCpuMoveFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayCpuMoveFun>(value),
    );
  }
}

String _$playCpuMoveHash() => r'44480ea1186bdeb63f1897232283c84473613fa4';

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
