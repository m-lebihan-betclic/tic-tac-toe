// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_di.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Required: throws until composition feeds it.

@ProviderFor(gameRouting)
final gameRoutingProvider = GameRoutingProvider._();

/// Required: throws until composition feeds it.

final class GameRoutingProvider
    extends $FunctionalProvider<GameRouting, GameRouting, GameRouting>
    with $Provider<GameRouting> {
  /// Required: throws until composition feeds it.
  GameRoutingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameRoutingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameRoutingHash();

  @$internal
  @override
  $ProviderElement<GameRouting> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameRouting create(Ref ref) {
    return gameRouting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameRouting value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameRouting>(value),
    );
  }
}

String _$gameRoutingHash() => r'913c906d3e2cddae766a1a12ad9c7d259b04723f';

/// Required. Who is playing is a session fact, not the board's — composition decides where it
/// comes from, which is what lets the setup sheet write it through a contract this feature never
/// sees.

@ProviderFor(player)
final playerProvider = PlayerProvider._();

/// Required. Who is playing is a session fact, not the board's — composition decides where it
/// comes from, which is what lets the setup sheet write it through a contract this feature never
/// sees.

final class PlayerProvider extends $FunctionalProvider<Player, Player, Player>
    with $Provider<Player> {
  /// Required. Who is playing is a session fact, not the board's — composition decides where it
  /// comes from, which is what lets the setup sheet write it through a contract this feature never
  /// sees.
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

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.

@ProviderFor(gameTheme)
final gameThemeProvider = GameThemeProvider._();

/// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
/// feature renders correctly whether or not composition passes a theme.

final class GameThemeProvider
    extends $FunctionalProvider<GameTheme, GameTheme, GameTheme>
    with $Provider<GameTheme> {
  /// Optional: unlike the throwing contracts, this one proxies the in-package default, so the
  /// feature renders correctly whether or not composition passes a theme.
  GameThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameThemeHash();

  @$internal
  @override
  $ProviderElement<GameTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameTheme create(Ref ref) {
    return gameTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameTheme>(value),
    );
  }
}

String _$gameThemeHash() => r'87cf5e2da496122c2c0a7d7f706e35353e067aab';
