// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storedDifficulty)
final storedDifficultyProvider = StoredDifficultyProvider._();

final class StoredDifficultyProvider
    extends $FunctionalProvider<Difficulty?, Difficulty?, Difficulty?>
    with $Provider<Difficulty?> {
  StoredDifficultyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedDifficultyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedDifficultyHash();

  @$internal
  @override
  $ProviderElement<Difficulty?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Difficulty? create(Ref ref) {
    return storedDifficulty(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Difficulty? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Difficulty?>(value),
    );
  }
}

String _$storedDifficultyHash() => r'b02fc95384dafeb715397f0db4c4af21241172af';

@ProviderFor(storedLocale)
final storedLocaleProvider = StoredLocaleProvider._();

final class StoredLocaleProvider
    extends $FunctionalProvider<AppLocale?, AppLocale?, AppLocale?>
    with $Provider<AppLocale?> {
  StoredLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedLocaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedLocaleHash();

  @$internal
  @override
  $ProviderElement<AppLocale?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLocale? create(Ref ref) {
    return storedLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLocale? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLocale?>(value),
    );
  }
}

String _$storedLocaleHash() => r'35250c72bc8814d8e0d0012598cc990a6697a9a9';

@ProviderFor(storedPlayer)
final storedPlayerProvider = StoredPlayerProvider._();

final class StoredPlayerProvider
    extends $FunctionalProvider<Player?, Player?, Player?>
    with $Provider<Player?> {
  StoredPlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedPlayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedPlayerHash();

  @$internal
  @override
  $ProviderElement<Player?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Player? create(Ref ref) {
    return storedPlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Player? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Player?>(value),
    );
  }
}

String _$storedPlayerHash() => r'2e65b3793b0fc93dca230a33f1b0126fa643ae99';

@ProviderFor(storedRounds)
final storedRoundsProvider = StoredRoundsProvider._();

final class StoredRoundsProvider
    extends $FunctionalProvider<List<Round>, List<Round>, List<Round>>
    with $Provider<List<Round>> {
  StoredRoundsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedRoundsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedRoundsHash();

  @$internal
  @override
  $ProviderElement<List<Round>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Round> create(Ref ref) {
    return storedRounds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Round> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Round>>(value),
    );
  }
}

String _$storedRoundsHash() => r'f74a4bc9dd167a9922add5a90c253736f8672064';

/// The tally, derived from the rounds rather than counted beside them.
///
/// Two counters that must agree can disagree, and a score that drifts from the history it
/// summarises is the kind of bug nothing catches. The board and the history screen read this same
/// provider, so they cannot disagree either.

@ProviderFor(storedScores)
final storedScoresProvider = StoredScoresProvider._();

/// The tally, derived from the rounds rather than counted beside them.
///
/// Two counters that must agree can disagree, and a score that drifts from the history it
/// summarises is the kind of bug nothing catches. The board and the history screen read this same
/// provider, so they cannot disagree either.

final class StoredScoresProvider
    extends $FunctionalProvider<Scores, Scores, Scores>
    with $Provider<Scores> {
  /// The tally, derived from the rounds rather than counted beside them.
  ///
  /// Two counters that must agree can disagree, and a score that drifts from the history it
  /// summarises is the kind of bug nothing catches. The board and the history screen read this same
  /// provider, so they cannot disagree either.
  StoredScoresProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedScoresProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedScoresHash();

  @$internal
  @override
  $ProviderElement<Scores> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Scores create(Ref ref) {
    return storedScores(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Scores value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Scores>(value),
    );
  }
}

String _$storedScoresHash() => r'00be87b077ee0e9bc9929de12b4e7eb3d5385cdc';

@ProviderFor(storedTheme)
final storedThemeProvider = StoredThemeProvider._();

final class StoredThemeProvider
    extends $FunctionalProvider<AppTheme?, AppTheme?, AppTheme?>
    with $Provider<AppTheme?> {
  StoredThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storedThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storedThemeHash();

  @$internal
  @override
  $ProviderElement<AppTheme?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppTheme? create(Ref ref) {
    return storedTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTheme? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTheme?>(value),
    );
  }
}

String _$storedThemeHash() => r'0167b121bdc7b49fe00f6722889c2d8d2ee00a0a';

@ProviderFor(saveDifficulty)
final saveDifficultyProvider = SaveDifficultyProvider._();

final class SaveDifficultyProvider
    extends
        $FunctionalProvider<
          SaveDifficultyFun,
          SaveDifficultyFun,
          SaveDifficultyFun
        >
    with $Provider<SaveDifficultyFun> {
  SaveDifficultyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveDifficultyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveDifficultyHash();

  @$internal
  @override
  $ProviderElement<SaveDifficultyFun> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SaveDifficultyFun create(Ref ref) {
    return saveDifficulty(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveDifficultyFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveDifficultyFun>(value),
    );
  }
}

String _$saveDifficultyHash() => r'692c5a9646b371872ddac1c487b276a1a98dd063';

@ProviderFor(saveLocale)
final saveLocaleProvider = SaveLocaleProvider._();

final class SaveLocaleProvider
    extends $FunctionalProvider<SaveLocaleFun, SaveLocaleFun, SaveLocaleFun>
    with $Provider<SaveLocaleFun> {
  SaveLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveLocaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveLocaleHash();

  @$internal
  @override
  $ProviderElement<SaveLocaleFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveLocaleFun create(Ref ref) {
    return saveLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveLocaleFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveLocaleFun>(value),
    );
  }
}

String _$saveLocaleHash() => r'82ac4b16f44c45245892ca11ca038e24142faef4';

@ProviderFor(savePlayer)
final savePlayerProvider = SavePlayerProvider._();

final class SavePlayerProvider
    extends $FunctionalProvider<SavePlayerFun, SavePlayerFun, SavePlayerFun>
    with $Provider<SavePlayerFun> {
  SavePlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savePlayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savePlayerHash();

  @$internal
  @override
  $ProviderElement<SavePlayerFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SavePlayerFun create(Ref ref) {
    return savePlayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavePlayerFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavePlayerFun>(value),
    );
  }
}

String _$savePlayerHash() => r'18a945b36a22d4ce45e590d4e84619d562c136a7';

@ProviderFor(saveRound)
final saveRoundProvider = SaveRoundProvider._();

final class SaveRoundProvider
    extends $FunctionalProvider<SaveRoundFun, SaveRoundFun, SaveRoundFun>
    with $Provider<SaveRoundFun> {
  SaveRoundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveRoundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveRoundHash();

  @$internal
  @override
  $ProviderElement<SaveRoundFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveRoundFun create(Ref ref) {
    return saveRound(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveRoundFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveRoundFun>(value),
    );
  }
}

String _$saveRoundHash() => r'd6efa05be43237e28f49a0d55aad73de568ed92c';

@ProviderFor(saveTheme)
final saveThemeProvider = SaveThemeProvider._();

final class SaveThemeProvider
    extends $FunctionalProvider<SaveThemeFun, SaveThemeFun, SaveThemeFun>
    with $Provider<SaveThemeFun> {
  SaveThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveThemeHash();

  @$internal
  @override
  $ProviderElement<SaveThemeFun> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveThemeFun create(Ref ref) {
    return saveTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveThemeFun value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveThemeFun>(value),
    );
  }
}

String _$saveThemeHash() => r'ed75d252ae17ed9d5ea7ca43e9edbd38c359fda5';
