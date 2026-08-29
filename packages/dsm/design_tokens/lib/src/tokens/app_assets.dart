/// Paths to the bundled SVGs.
///
/// The `packages/design_tokens/` prefix is mandatory: the files live in this package, not in
/// the app, so a feature can reference them without depending on the binary.
class AppAssets {
  const AppAssets._();

  /// Matrix theme only, settings header. Two states of the same silhouette; the pair is
  /// mirrored, so placed side by side the rabbits face each other.
  static const String bunnyFilled = '$_path/bunny_filled.svg';
  static const String bunnyOutline = '$_path/bunny_outline.svg';

  static const String iconClose = '$_path/icon_close_16.svg';

  /// The nine-square mark. One geometry, exported at the two sizes the app renders it at.
  /// Its three fills carry the dark palette and are remapped to `markPlayer` / `markCpu` /
  /// `outline` of the active theme.
  static const String mark21 = '$_path/mark_21.svg';
  static const String mark74 = '$_path/mark_74.svg';

  static const String _path = 'packages/design_tokens/assets';
}
