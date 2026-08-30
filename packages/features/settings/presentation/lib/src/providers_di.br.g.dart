// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Required. The language actually in force, which is not the same as the stored one: nothing is
/// stored until somebody picks, and until then the device decides.
///
/// The screen has to render a selection either way, and narrowing a device locale to the two the
/// app ships is composition's rule — it is the same resolution `MaterialApp` is given. Reading it
/// as a contract keeps that rule in one place instead of two that can disagree.

@ProviderFor(activeLocale)
final activeLocaleProvider = ActiveLocaleProvider._();

/// Required. The language actually in force, which is not the same as the stored one: nothing is
/// stored until somebody picks, and until then the device decides.
///
/// The screen has to render a selection either way, and narrowing a device locale to the two the
/// app ships is composition's rule — it is the same resolution `MaterialApp` is given. Reading it
/// as a contract keeps that rule in one place instead of two that can disagree.

final class ActiveLocaleProvider
    extends $FunctionalProvider<AppLocale, AppLocale, AppLocale>
    with $Provider<AppLocale> {
  /// Required. The language actually in force, which is not the same as the stored one: nothing is
  /// stored until somebody picks, and until then the device decides.
  ///
  /// The screen has to render a selection either way, and narrowing a device locale to the two the
  /// app ships is composition's rule — it is the same resolution `MaterialApp` is given. Reading it
  /// as a contract keeps that rule in one place instead of two that can disagree.
  ActiveLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeLocaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeLocaleHash();

  @$internal
  @override
  $ProviderElement<AppLocale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLocale create(Ref ref) {
    return activeLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLocale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLocale>(value),
    );
  }
}

String _$activeLocaleHash() => r'86cbd7299e9770677ddac9d4ec07d58ad7f5f7a2';

/// Required, and for the same reason as [activeLocale]: on a cold start no theme is stored and
/// the app is wearing the platform's own. A settings screen showing three unselected rows while
/// the app is visibly dark would be reporting storage, not reality.

@ProviderFor(activeTheme)
final activeThemeProvider = ActiveThemeProvider._();

/// Required, and for the same reason as [activeLocale]: on a cold start no theme is stored and
/// the app is wearing the platform's own. A settings screen showing three unselected rows while
/// the app is visibly dark would be reporting storage, not reality.

final class ActiveThemeProvider
    extends $FunctionalProvider<AppTheme, AppTheme, AppTheme>
    with $Provider<AppTheme> {
  /// Required, and for the same reason as [activeLocale]: on a cold start no theme is stored and
  /// the app is wearing the platform's own. A settings screen showing three unselected rows while
  /// the app is visibly dark would be reporting storage, not reality.
  ActiveThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeThemeHash();

  @$internal
  @override
  $ProviderElement<AppTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppTheme create(Ref ref) {
    return activeTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTheme>(value),
    );
  }
}

String _$activeThemeHash() => r'0f9b9489765735a3b512eed0f6c296bab6c508e6';

/// Required. Who is playing is a session fact, and the same one the board reads — composition
/// answers both from one place rather than each screen deciding what an unnamed player means.

@ProviderFor(player)
final playerProvider = PlayerProvider._();

/// Required. Who is playing is a session fact, and the same one the board reads — composition
/// answers both from one place rather than each screen deciding what an unnamed player means.

final class PlayerProvider extends $FunctionalProvider<Player, Player, Player>
    with $Provider<Player> {
  /// Required. Who is playing is a session fact, and the same one the board reads — composition
  /// answers both from one place rather than each screen deciding what an unnamed player means.
  PlayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerHash();

  @$internal
  @override
  $ProviderElement<Player> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Player create(Ref ref) {
    return player(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Player value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Player>(value),
    );
  }
}

String _$playerHash() => r'b635007bf6588e904c15652977cb841bb69ec6e6';

/// Required: throws until composition feeds it.

@ProviderFor(settingsRouting)
final settingsRoutingProvider = SettingsRoutingProvider._();

/// Required: throws until composition feeds it.

final class SettingsRoutingProvider
    extends
        $FunctionalProvider<SettingsRouting, SettingsRouting, SettingsRouting>
    with $Provider<SettingsRouting> {
  /// Required: throws until composition feeds it.
  SettingsRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRoutingHash();

  @$internal
  @override
  $ProviderElement<SettingsRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRouting create(Ref ref) {
    return settingsRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRouting>(value),
    );
  }
}

String _$settingsRoutingHash() => r'31bc334b9e3fbeb1b5d9ea78f6ef6056803e22d1';

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.

@ProviderFor(settingsTheme)
final settingsThemeProvider = SettingsThemeProvider._();

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.

final class SettingsThemeProvider
    extends $FunctionalProvider<SettingsTheme, SettingsTheme, SettingsTheme>
    with $Provider<SettingsTheme> {
  /// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
  /// feature renders correctly whether or not composition passes a theme.
  SettingsThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsThemeHash();

  @$internal
  @override
  $ProviderElement<SettingsTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsTheme create(Ref ref) {
    return settingsTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsTheme>(value),
    );
  }
}

String _$settingsThemeHash() => r'7b08f3dc995ab220ea5bf2aed3876501acacdb9a';

/// Required. The app's own version, as the build stamped it into the bundle. A feature has no
/// business making a platform call, and a constant here would be a second copy of a number that
/// is declared in the app's `pubspec.yaml`.

@ProviderFor(version)
final versionProvider = VersionProvider._();

/// Required. The app's own version, as the build stamped it into the bundle. A feature has no
/// business making a platform call, and a constant here would be a second copy of a number that
/// is declared in the app's `pubspec.yaml`.

final class VersionProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// Required. The app's own version, as the build stamped it into the bundle. A feature has no
  /// business making a platform call, and a constant here would be a second copy of a number that
  /// is declared in the app's `pubspec.yaml`.
  VersionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'versionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$versionHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return version(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$versionHash() => r'a02b547f38807d79bcf393461e11ffca8fe0b8e2';
