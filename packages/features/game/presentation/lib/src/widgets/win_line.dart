import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:session_domain/session_domain.dart';

/// The stroke through a completed line, drawn above the marks.
///
/// A set, not one line: a single move can complete two, and drawing one of them would show the
/// player half of what they just did.
///
/// It draws itself on over [AppMotion.winLine] rather than appearing whole. This is the one
/// moment in the game worth animating — the line is the answer to the move that was just played,
/// and a stroke that arrives instantly reads as a decoration rather than as a result. Two lines
/// completed at once draw together, because they happened together.
class WinLine extends StatefulWidget {
  final Color color;
  final Set<WinningLine> lines;

  const WinLine({required this.color, required this.lines, super.key});

  @override
  State<WinLine> createState() => _WinLineState();
}

class _WinLineState extends State<WinLine> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: AppMotion.winLine,
    vsync: this,
  )..forward();

  late final Animation<double> _progress = CurvedAnimation(
    curve: AppMotion.winLineCurve,
    parent: _controller,
  );

  @override
  void didUpdateWidget(WinLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    // A different line means a different round, so it draws again from nothing.
    if (widget.lines != oldWidget.lines) _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: IgnorePointer(
      child: CustomPaint(
        painter: _WinLinePainter(color: widget.color, lines: widget.lines, progress: _progress),
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
  final Animation<double> progress;

  _WinLinePainter({required this.color, required this.lines, required this.progress}) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _stroke;

    for (final WinningLine line in lines) {
      final (Offset from, Offset to) = _endpoints(line, size);
      // Grown from its start rather than faded in: the stroke travels the way the eye would
      // trace it, and at t=1 it is exactly the line it always was.
      canvas.drawLine(from, Offset.lerp(from, to, progress.value) ?? to, paint);
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
