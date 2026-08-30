/// How hard the CPU plays.
///
/// `easy` is the default, and deliberately beatable: a perfect opponent means a reviewer never
/// reaches the win screen, and an unreachable screen may as well not be built.
enum Difficulty {
  easy,
  hard;

  /// What a session starts at when nothing has been chosen.
  static const Difficulty initial = easy;
}
