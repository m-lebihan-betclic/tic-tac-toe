import 'package:flutter/material.dart';

/// The type scale: eight styles, **without colour**.
///
/// The design system owns size, weight, tracking and family; the feature theme applies the
/// colour, because the same style is used in several roles (`caption` is `onSurfaceMuted` in
/// the score row and `warning` on the invalid-move label).
///
/// No font files ship with the app. Light and dark use the platform sans — `fontFamily` stays
/// null, which is what gives `.SF Pro` on iOS and `Roboto` on Android. Matrix swaps the family
/// for the platform monospace and changes nothing else.
///
/// [caption] and [statValue] are monospace in **all three** themes. That is the one deliberate
/// type accent, and [statValue] is the only style carrying tabular figures — everywhere else
/// the text is a label or a sentence, so digit width never matters.
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle body;
  final TextStyle bold;
  final TextStyle caption;
  final TextStyle prominent;
  final TextStyle statValue;
  final TextStyle title;
  final TextStyle wordmark;

  const AppTypography({
    required this.body,
    required this.bold,
    required this.caption,
    required this.prominent,
    required this.statValue,
    required this.title,
    required this.wordmark,
  });

  /// [monospace] switches the sans styles to the platform monospace, for the matrix theme.
  /// The mono styles are unaffected — they are already monospace.
  factory AppTypography.system({bool monospace = false}) {
    final List<String>? family = monospace ? monospaceFallback : null;

    return AppTypography(
      body: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, fontFamilyFallback: family),
      bold: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamilyFallback: family),
      caption: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        fontFamilyFallback: monospaceFallback,
      ),
      prominent: TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.19,
        fontFamilyFallback: family,
      ),
      statValue: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        fontFamilyFallback: monospaceFallback,
        fontFeatures: [FontFeature.tabularFigures()],
      ),
      title: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.4,
        fontFamilyFallback: family,
      ),
      // The only w800 in the scale. A lockup is set once and read as a shape, so it carries its
      // size and its +16% tracking here rather than being a `copyWith` at the call site. The
      // weight is deliberate: SF Pro's w600 is Semibold and its w700 is a Bold that still reads
      // thin at 26px under +16% tracking, because the wide letter-spacing pulls the stems apart.
      // w800 is Heavy, and it is what makes the lockup read as a mark rather than as a heading.
      wordmark: TextStyle(
        fontSize: _wordmarkSize,
        fontWeight: FontWeight.w800,
        letterSpacing: _wordmarkSize * 0.16,
        fontFamilyFallback: family,
      ),
    );
  }

  static const double _wordmarkSize = 26;

  /// Flutter has no portable `monospace` family name: Android resolves it, Apple platforms do
  /// not. The fallback chain covers both without bundling a font.
  static const List<String> monospaceFallback = <String>[
    'Menlo',
    'SF Mono',
    'Roboto Mono',
    'DroidSansMono',
    'monospace',
  ];

  @override
  AppTypography copyWith({
    TextStyle? body,
    TextStyle? bold,
    TextStyle? caption,
    TextStyle? prominent,
    TextStyle? statValue,
    TextStyle? title,
    TextStyle? wordmark,
  }) => AppTypography(
    body: body ?? this.body,
    bold: bold ?? this.bold,
    caption: caption ?? this.caption,
    prominent: prominent ?? this.prominent,
    statValue: statValue ?? this.statValue,
    title: title ?? this.title,
    wordmark: wordmark ?? this.wordmark,
  );

  /// Type does not animate: matrix swaps the family outright, and interpolating a font size
  /// mid-switch would only produce a frame of text at 23.4px. Snap at the halfway point.
  @override
  AppTypography lerp(covariant AppTypography? other, double t) => t < 0.5 ? this : (other ?? this);

  /// `warningText` is not a separate style — it is [title] with a colour swap, applied by the
  /// feature theme. This helper exists so nobody re-derives the size and tracking by hand.
  TextStyle warningText(Color color) => title.copyWith(color: color);
}
