import 'package:game_domain/src/entities/board.dart';

/// How the CPU picks its slot.
///
/// The seam exists so difficulty is a *choice of implementation* rather than a branch inside one
/// algorithm, and so a test can stand in the middle of it. Never exported: what the CPU knows is
/// a rule, and rules stay in this package.
abstract interface class CpuStrategy {
  /// A free slot on [board]. Callers guarantee there is one.
  int chooseSlot(Board board);
}
