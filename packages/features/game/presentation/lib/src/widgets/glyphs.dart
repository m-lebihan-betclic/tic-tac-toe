import 'package:flutter/widgets.dart';

/// Three bars, bottom-aligned — the session-history button's glyph.
class HistoryGlyph extends StatelessWidget {
  static const List<double> _heights = <double>[10, 16, 13];
  static const double _barWidth = 3;
  static const double _gap = 3;

  final Color color;

  const HistoryGlyph({required this.color, super.key});

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    spacing: _gap,
    children: <Widget>[
      for (final double height in _heights)
        SizedBox(
          height: height,
          width: _barWidth,
          child: ColoredBox(color: color),
        ),
    ],
  );
}

/// A ring — the settings button's glyph.
class SettingsGlyph extends StatelessWidget {
  static const double _diameter = 16;
  static const double _stroke = 2;

  final Color color;

  const SettingsGlyph({required this.color, super.key});

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
