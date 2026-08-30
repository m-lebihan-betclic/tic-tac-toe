import 'dart:math' as math;

import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// Three dots pulsing on [AppMotion.dotBlink], each offset by [AppMotion.dotStagger].
///
/// Its second caller is the game screen's thinking state, which is what earned it a place here.
class BlinkingDots extends StatefulWidget {
  final Color color;

  const BlinkingDots({required this.color, super.key});

  @override
  State<BlinkingDots> createState() => _BlinkingDotsState();
}

class _BlinkingDotsState extends State<BlinkingDots> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: AppMotion.dotBlink,
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: _dotGap,
      children: <Widget>[
        for (int index = 0; index < _dotCount; index++)
          _Dot(
            color: widget.color,
            listenable: _controller,
            // The stagger as a fraction of one cycle, so the three dots sit at even phases.
            phase: index * (AppMotion.dotStagger.inMilliseconds / AppMotion.dotBlink.inMilliseconds),
          ),
      ],
    ),
  );
}

class _Dot extends AnimatedWidget {
  final Color color;
  final double phase;

  const _Dot({required this.color, required this.phase, required super.listenable});

  @override
  Widget build(BuildContext context) {
    final controller = listenable as AnimationController;
    final t = (controller.value + phase) % 1;
    // A cosine pulse rather than a linear fade: the dot spends longer near full and near dim,
    // which is what reads as a blink instead of a throb.
    final opacity = _dotMinOpacity + (1 - _dotMinOpacity) * (0.5 - 0.5 * math.cos(2 * math.pi * t));

    return Opacity(
      opacity: opacity,
      child: SizedBox.square(
        dimension: _dotDiameter,
        child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

/// Off the spacing scale, so they stay here rather than becoming tokens: a 6px dot at a 7px gap
/// is the drawn lockup, not a step anything else reuses.
const int _dotCount = 3;
const double _dotDiameter = 6;
const double _dotGap = 7;
const double _dotMinOpacity = 0.25;
