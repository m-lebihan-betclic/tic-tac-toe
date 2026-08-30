// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_ui_state_notifier.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives the board.
///
/// It calls behaviors and never a repository: if this file ever watches a repository provider,
/// the layering has gone wrong.

@ProviderFor(GameUiStateNotifier)
final gameUiStateProvider = GameUiStateNotifierProvider._();

/// Drives the board.
///
/// It calls behaviors and never a repository: if this file ever watches a repository provider,
/// the layering has gone wrong.
final class GameUiStateNotifierProvider
    extends $NotifierProvider<GameUiStateNotifier, GameUiState> {
  /// Drives the board.
  ///
  /// It calls behaviors and never a repository: if this file ever watches a repository provider,
  /// the layering has gone wrong.
  GameUiStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameUiStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameUiStateNotifierHash();

  @$internal
  @override
  GameUiStateNotifier create() => GameUiStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameUiState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameUiState>(value),
    );
  }
}

String _$gameUiStateNotifierHash() =>
    r'8a10fa9151a1b7ffaa4c5eb1e5125d9d97312379';

/// Drives the board.
///
/// It calls behaviors and never a repository: if this file ever watches a repository provider,
/// the layering has gone wrong.

abstract class _$GameUiStateNotifier extends $Notifier<GameUiState> {
  GameUiState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GameUiState, GameUiState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameUiState, GameUiState>,
              GameUiState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
