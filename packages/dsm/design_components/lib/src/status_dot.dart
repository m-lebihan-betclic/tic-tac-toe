import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// The `9px` dot beside a status label.
///
/// Blinks only where the app is waiting on something — the CPU's turn. A dot that pulses while
/// nothing is happening says the app is busy when it is not.
class StatusDot extends StatefulWidget {
  final bool blinking;
  final Color color;

  const StatusDot({required this.color, this.blinking = false, super.key});

  @override
  State<StatusDot> createState() => _StatusDotState();
}

class _StatusDotState extends State<StatusDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: AppMotion.turnDotBlink,
    vsync: this,
  );

  @override
  void didUpdateWidget(StatusDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _syncAnimation();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: FadeTransition(
      opacity: _opacity,
      child: SizedBox.square(
        dimension: _diameter,
        child: DecoratedBox(
          decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
        ),
      ),
    ),
  );

  Animation<double> get _opacity => Tween<double>(begin: 1, end: _minOpacity).animate(_controller);

  void _syncAnimation() {
    if (widget.blinking) {
      _controller.repeat(reverse: true);
    } else {
      _controller
        ..stop()
        ..value = 0;
    }
  }

  /// Off the spacing scale: a 9px dot is the drawn status lockup, not a step anything reuses.
  static const double _diameter = 9;
  static const double _minOpacity = 0.3;
}
