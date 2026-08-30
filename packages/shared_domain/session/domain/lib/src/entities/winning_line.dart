/// The eight lines that win a game.
///
/// An enum rather than a `String`, because a line's name is rendered into a translated sentence.
/// Produced in Dart it would be an untranslated English word smuggled through a `{line}`
/// placeholder, and French would read `Gagné · left column`. The eight l10n keys already exist
/// (`lineTopRow`, `lineLeftColumn`, …); presentation maps enum to key.
enum WinningLine {
  bottomRow,
  diagonalDown,
  diagonalUp,
  leftColumn,
  middleColumn,
  middleRow,
  rightColumn,
  topRow,
}
