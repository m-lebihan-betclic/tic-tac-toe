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

String _$defaultGameThemeHash() => r'6826be6f2592ad90a9c3f50a27a72e97eea25267';
