// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feature's default theme, derived from the design-system tokens. This is the only place in
/// the feature that reads the palette or the type scale: everything else reads
/// `gameThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.

@ProviderFor(defaultGameTheme)
final defaultGameThemeProvider = DefaultGameThemeProvider._();

/// The feature's default theme, derived from the design-system tokens. This is the only place in
/// the feature that reads the palette or the type scale: everything else reads
/// `gameThemeProvider`.
///
/// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
/// changing a line.

final class DefaultGameThemeProvider
    extends $FunctionalProvider<GameTheme, GameTheme, GameTheme>
    with $Provider<GameTheme> {
  /// The feature's default theme, derived from the design-system tokens. This is the only place in
  /// the feature that reads the palette or the type scale: everything else reads
  /// `gameThemeProvider`.
  ///
  /// Composition can replace it wholesale via `bindProviders(theme: …)` without the feature
  /// changing a line.
  DefaultGameThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultGameThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultGameThemeHash();

  @$internal
  @override
  $ProviderElement<GameTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameTheme create(Ref ref) {
    return defaultGameTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameTheme>(value),
    );
  }
}

String _$defaultGameThemeHash() => r'f0253914673f4b69056d6c0d4d8c0d48f70dc023';

/// How long the CPU appears to think, drawn fresh each turn from
/// [AppMotion.cpuThinkingMin]..[AppMotion.cpuThinkingDelay] in [AppMotion.cpuThinkingStep]
/// increments.
///
/// Presentation, not a rule: the domain plays instantly, and this is only what the player sees
/// while nothing is happening. A test overrides it to make the wait deterministic.

@ProviderFor(cpuBeat)
final cpuBeatProvider = CpuBeatProvider._();

/// How long the CPU appears to think, drawn fresh each turn from
/// [AppMotion.cpuThinkingMin]..[AppMotion.cpuThinkingDelay] in [AppMotion.cpuThinkingStep]
/// increments.
///
/// Presentation, not a rule: the domain plays instantly, and this is only what the player sees
/// while nothing is happening. A test overrides it to make the wait deterministic.

final class CpuBeatProvider
    extends $FunctionalProvider<Duration, Duration, Duration>
    with $Provider<Duration> {
  /// How long the CPU appears to think, drawn fresh each turn from
  /// [AppMotion.cpuThinkingMin]..[AppMotion.cpuThinkingDelay] in [AppMotion.cpuThinkingStep]
  /// increments.
  ///
  /// Presentation, not a rule: the domain plays instantly, and this is only what the player sees
  /// while nothing is happening. A test overrides it to make the wait deterministic.
  CpuBeatProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cpuBeatProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cpuBeatHash();

  @$internal
  @override
  $ProviderElement<Duration> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Duration create(Ref ref) {
    return cpuBeat(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Duration value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Duration>(value),
    );
  }
}

String _$cpuBeatHash() => r'b6be0646b1f0a483a4ddb589b41e8fcf897d7042';

/// The seeded seam. Nothing but a test has a reason to override it.

@ProviderFor(cpuBeatRandom)
final cpuBeatRandomProvider = CpuBeatRandomProvider._();

/// The seeded seam. Nothing but a test has a reason to override it.

final class CpuBeatRandomProvider
    extends $FunctionalProvider<Random, Random, Random>
    with $Provider<Random> {
  /// The seeded seam. Nothing but a test has a reason to override it.
  CpuBeatRandomProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cpuBeatRandomProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cpuBeatRandomHash();

  @$internal
  @override
  $ProviderElement<Random> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Random create(Ref ref) {
    return cpuBeatRandom(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Random value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Random>(value),
    );
  }
}

String _$cpuBeatRandomHash() => r'229f945a3e86d2927bf4ad091b61f1cd7d2ca018';
