import 'package:flutter/animation.dart';

/// Every duration and curve the app animates with.
///
/// [cpuThinkingDelay] is a **presentation** beat: it exists so the CPU's move does not land in
/// the same frame as the player's. It must never reach the domain, and it must be cancellable —
/// `Reset game` stays enabled during the CPU's turn.
///
/// Animations always run. Do **not** branch on `MediaQuery.disableAnimations` to skip, shorten
/// or snap any of these: the motion is part of the design, not an embellishment on top of it.
///
/// There are deliberately no haptics anywhere in the app, so nothing here has a counterpart in
/// `HapticFeedback`.
///
/// There is deliberately no `invalidHold`. An invalid move is cleared by the next **valid**
/// move, not by a clock: a warning that expires while the mistake is still on screen tells the
/// player the problem went away, and it had not.
class AppMotion {
  const AppMotion._();

  static const Duration cpuThinkingDelay = Duration(milliseconds: 700);

  /// The beat is drawn from [cpuThinkingMin]..[cpuThinkingDelay] in [cpuThinkingStep]
  /// increments. A fixed pause reads as a timer; a varying one reads as somebody thinking, and
  /// the range is narrow enough that nobody waits noticeably longer for it.
  static const Duration cpuThinkingMin = Duration(milliseconds: 300);
  static const Duration cpuThinkingStep = Duration(milliseconds: 100);

  /// The shake fires **once, on the tap** — it reacts to an event. The warning ring and the
  /// status line have a different lifetime: they persist until the next valid move, because they
  /// describe a condition that is still true. Do not drive both from one animation controller.
  static const Curve invalidShakeCurve = Curves.easeInOut;
  static const Duration invalidShake = Duration(milliseconds: 200);
  static const double invalidShakeAmplitude = 6;
  static const int invalidShakeOscillations = 2;

  static const Curve markInCurve = Curves.easeOut;
  static const Duration markIn = Duration(milliseconds: 120);
  static const double markInScaleFrom = 0.8;

  /// Every interactive surface in the app shares one press treatment: the fill shifts over
  /// [press], linearly, with no ripple, no scale and no elevation. Outlined and transparent
  /// surfaces go to `surfacePressed`; filled surfaces use `AppPalette.pressedFill`. Because
  /// nothing here uses Material's ink, there is no splash to suppress.
  static const Duration press = Duration(milliseconds: 90);
  static const Curve statusCrossFadeCurve = Curves.easeInOut;
  static const Duration statusCrossFade = Duration(milliseconds: 160);
  static const Duration themeSwitch = Duration(milliseconds: 200);
  static const Curve winLineCurve = Curves.easeOutCubic;
  static const Duration winLine = Duration(milliseconds: 260);

  /// Blink cadences: the CPU turn dot, and the splash / thinking dots with their stagger.
  static const Duration dotBlink = Duration(milliseconds: 1200);
  static const Duration dotStagger = Duration(milliseconds: 200);
  static const Duration turnDotBlink = Duration(milliseconds: 1100);

  /// Splash hold before the setup sheet animates up.
  static const Duration splashHold = Duration(milliseconds: 600);
}
