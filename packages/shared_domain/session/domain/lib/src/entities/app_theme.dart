/// The three themes the app ships.
///
/// This does **not** know about `AppPalette`. Composition maps one to the other, which is what
/// lets `design_tokens` depend on nothing and lets a preference be stored without the storage
/// layer ever seeing a `Color`.
enum AppTheme {
  dark,
  light,
  matrix;

  /// The order the choices are offered in, which is not the order they are declared in.
  ///
  /// Declaration stays alphabetical, because that is this repo's rule for enum constants.
  /// Presentation order is a design decision — the drawing puts light first in both the setup
  /// sheet and settings — and it lives here rather than in either screen because the two must
  /// agree: settings is specified as "the same three as the sheet", and two private lists are
  /// two things that can drift apart.
  static const List<AppTheme> ordered = <AppTheme>[light, dark, matrix];
}
