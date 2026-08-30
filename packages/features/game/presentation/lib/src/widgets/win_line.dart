import 'package:flutter/widgets.dart';
import 'package:session_domain/session_domain.dart';

/// The stroke through a completed line, drawn above the marks.
///
/// A set, not one line: a single move can complete two, and drawing one of them would show the
/// player half of what they just did.
class WinLine extends StatelessWidget {
  final Color color;
  final Set<WinningLine> lines;

  const WinLine({required this.color, required this.lines, super.key});

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: IgnorePointer(
      child: CustomPaint(
        painter: _WinLinePainter(color: color, lines: lines),
        size: Size.infinite,
      ),
    ),
  );
}

class _WinLinePainter extends CustomPainter {
  /// Rows and columns run 84% of the board, centred on the run. Diagonals go corner to corner.
  static const double _runFraction = 0.84;
  static const double _stroke = 4;

  final Color color;
  final Set<WinningLine> lines;

  const _WinLinePainter({required this.color, required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _stroke;

    for (final WinningLine line in lines) {
      final (Offset from, Offset to) = _endpoints(line, size);
      canvas.drawLine(from, to, paint);
    }
  }

  @override
  bool shouldRepaint(_WinLinePainter oldDelegate) => oldDelegate.color != color || oldDelegate.lines != lines;

  (Offset, Offset) _endpoints(WinningLine line, Size size) {
    final double inset = size.width * (1 - _runFraction) / 2;
    // The three band centres: an eighth, a half, seven eighths of the way across.
    final double near = size.height / 6;
    final double mid = size.height / 2;
    final double far = size.height * 5 / 6;

    return switch (line) {
      WinningLine.topRow => (Offset(inset, near), Offset(size.width - inset, near)),
      WinningLine.middleRow => (Offset(inset, mid), Offset(size.width - inset, mid)),
      WinningLine.bottomRow => (Offset(inset, far), Offset(size.width - inset, far)),
      WinningLine.leftColumn => (Offset(near, inset), Offset(near, size.height - inset)),
      WinningLine.middleColumn => (Offset(mid, inset), Offset(mid, size.height - inset)),
      WinningLine.rightColumn => (Offset(far, inset), Offset(far, size.height - inset)),
      WinningLine.diagonalDown => (Offset.zero, Offset(size.width, size.height)),
      WinningLine.diagonalUp => (Offset(size.width, 0), Offset(0, size.height)),
    };
  }
}
