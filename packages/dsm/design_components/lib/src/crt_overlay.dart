import 'package:flutter/widgets.dart';

/// The matrix theme's scanlines, over everything.
///
/// [color] is `AppPalette.crtOverlay`, which is null in light and dark — so this is a no-op in
/// two of the three themes and the caller does not have to know which. That is the whole reason
/// the token is nullable: the app wraps every screen once and the palette decides.
///
/// In front of the content rather than behind it, which is where a real tube puts them. Behind,
/// they would be invisible under every opaque cell and card — which is most of the app.
class CrtOverlay extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CrtOverlay({required this.child, required this.color, super.key});

  @override
  Widget build(BuildContext context) => switch (color) {
    final Color color => Stack(
      children: <Widget>[
        child,
        // Never eats a tap: it is a texture, not a surface.
        Positioned.fill(
          child: IgnorePointer(
            child: RepaintBoundary(
              child: CustomPaint(painter: _CrtPainter(color: color)),
            ),
          ),
        ),
      ],
    ),
    null => child,
  };
}

/// Two grids of hairlines: coarse columns and fine rows, both at a few percent.
///
/// Drawn rather than tiled from an asset because the geometry is two numbers and a colour, and an
/// image would have to ship at three densities to stay one pixel wide at each of them.
class _CrtPainter extends CustomPainter {
  static const double _columnSpacing = 26;
  static const double _columnOpacity = 0.055;
  static const double _rowSpacing = 4;
  static const double _rowOpacity = 0.05;
  static const double _hairline = 1;

  final Color color;

  const _CrtPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint rows = Paint()..color = color.withValues(alpha: _rowOpacity);
    for (double y = 0; y < size.height; y += _rowSpacing) {
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, _hairline), rows);
    }

    final Paint columns = Paint()..color = color.withValues(alpha: _columnOpacity);
    for (double x = 0; x < size.width; x += _columnSpacing) {
      canvas.drawRect(Rect.fromLTWH(x, 0, _hairline, size.height), columns);
    }
  }

  @override
  bool shouldRepaint(_CrtPainter oldDelegate) => oldDelegate.color != color;
}
