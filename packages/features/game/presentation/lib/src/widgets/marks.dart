import 'dart:math' as math;

import 'package:flutter/widgets.dart';

/// X: two bars crossed at ±45°. Drawn rather than imported — it is two rectangles, and an asset
/// would be a file to keep in sync with a colour that changes per theme.
class PlayerMark extends StatelessWidget {
  static const double _barLength = 46;
  static const double _barThickness = 4;
  static const double _barRadius = 2;

  final Color color;

  const PlayerMark({required this.color, super.key});

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: _barLength,
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        for (final double turns in <double>[0.125, -0.125])
          Transform.rotate(
            angle: turns * 2 * math.pi,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_barRadius),
                color: color,
              ),
              height: _barThickness,
              width: _barLength,
            ),
          ),
      ],
    ),
  );
}

/// O: a ring. A border rather than a painted circle, so the stroke stays even at every size.
class CpuMark extends StatelessWidget {
  static const double _diameter = 40;
  static const double _stroke = 4;

  final Color color;

  const CpuMark({required this.color, super.key});

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: _diameter,
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: _stroke),
        shape: BoxShape.circle,
      ),
    ),
  );
}
