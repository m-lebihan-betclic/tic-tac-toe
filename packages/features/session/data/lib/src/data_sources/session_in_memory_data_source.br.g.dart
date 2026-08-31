// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_in_memory_data_source.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The session, held in memory for the life of the process.
///
/// A notifier rather than a mutable object, and that is the whole point: a write replaces the
/// snapshot, so everything reading the session rebuilds. A plain class with fields would store
/// the value correctly and tell nobody, which is a bug that looks like a design.
///
/// `keepAlive` is load-bearing. Without it the store is disposed the moment no screen watches,
/// and the session evaporates — the nickname would survive right up until the player opened
/// settings and came back.

@ProviderFor(SessionInMemoryDataSource)
final sessionInMemoryDataSourceProvider = SessionInMemoryDataSourceProvider._();

/// The session, held in memory for the life of the process.
///
/// A notifier rather than a mutable object, and that is the whole point: a write replaces the
/// snapshot, so everything reading the session rebuilds. A plain class with fields would store
/// the value correctly and tell nobody, which is a bug that looks like a design.
///
/// `keepAlive` is load-bearing. Without it the store is disposed the moment no screen watches,
/// and the session evaporates — the nickname would survive right up until the player opened
/// settings and came back.
final class SessionInMemoryDataSourceProvider
    extends $NotifierProvider<SessionInMemoryDataSource, SessionSnapshot> {
  /// The session, held in memory for the life of the process.
  ///
  /// A notifier rather than a mutable object, and that is the whole point: a write replaces the
  /// snapshot, so everything reading the session rebuilds. A plain class with fields would store
  /// the value correctly and tell nobody, which is a bug that looks like a design.
  ///
  /// `keepAlive` is load-bearing. Without it the store is disposed the moment no screen watches,
  /// and the session evaporates — the nickname would survive right up until the player opened
  /// settings and came back.
  SessionInMemoryDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionInMemoryDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionInMemoryDataSourceHash();

  @$internal
  @override
  SessionInMemoryDataSource create() => SessionInMemoryDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionSnapshot value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionSnapshot>(value),
    );
  }
}

String _$sessionInMemoryDataSourceHash() =>
    r'0042add1fbb6894b3445824327deebb81a5cb8e8';

/// The session, held in memory for the life of the process.
///
/// A notifier rather than a mutable object, and that is the whole point: a write replaces the
/// snapshot, so everything reading the session rebuilds. A plain class with fields would store
/// the value correctly and tell nobody, which is a bug that looks like a design.
///
/// `keepAlive` is load-bearing. Without it the store is disposed the moment no screen watches,
/// and the session evaporates — the nickname would survive right up until the player opened
/// settings and came back.

abstract class _$SessionInMemoryDataSource extends $Notifier<SessionSnapshot> {
  SessionSnapshot build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SessionSnapshot, SessionSnapshot>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SessionSnapshot, SessionSnapshot>,
              SessionSnapshot,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
