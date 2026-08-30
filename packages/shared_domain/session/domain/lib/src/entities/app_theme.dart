/// The three themes the app ships.
///
/// This does **not** know about `AppPalette`. Composition maps one to the other, which is what
/// lets `design_tokens` depend on nothing and lets a preference be stored without the storage
/// layer ever seeing a `Color`.
enum AppTheme { dark, light, matrix }
