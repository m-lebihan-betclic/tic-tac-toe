// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_internal.br.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.

@ProviderFor(defaultHistoryTheme)
final defaultHistoryThemeProvider = DefaultHistoryThemeProvider._();

/// The feature's default theme, derived from the design-system tokens. The only place in the
/// feature that reads the palette or the type scale.

final class DefaultHistoryThemeProvider
    extends $FunctionalProvider<HistoryTheme, HistoryTheme, HistoryTheme>
    with $Provider<HistoryTheme> {
  /// The feature's default theme, derived from the design-system tokens. The only place in the
  /// feature that reads the palette or the type scale.
  DefaultHistoryThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultHistoryThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultHistoryThemeHash();

  @$internal
  @override
  $ProviderElement<HistoryTheme> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HistoryTheme create(Ref ref) {
    return defaultHistoryTheme(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HistoryTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HistoryTheme>(value),
    );
  }
}

String _$defaultHistoryThemeHash() =>
    r'87da4f66295aca2d4b9bebe90e557e896718efe4';
