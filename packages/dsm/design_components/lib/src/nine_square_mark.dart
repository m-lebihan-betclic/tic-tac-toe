import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The nine-square mark, at the two sizes the app draws it.
///
/// Two named constructors rather than a size parameter, because the artwork is exported twice —
/// 21px squares are not 74px squares scaled down, they are drawn with their own gaps and radii.
/// A free `size` would let a caller ask for a size no asset exists at.
class NineSquareMark extends StatelessWidget {
  final String _asset;
  final Color _cpuColor;
  final Color _outlineColor;
  final Color _playerColor;
  final double _size;

  /// [AppSizing.markAppBar] — the board's app bar.
  const NineSquareMark.appBar({
    required Color cpuColor,
    required Color outlineColor,
    required Color playerColor,
    super.key,
  }) : _asset = AppAssets.mark21,
       _cpuColor = cpuColor,
       _outlineColor = outlineColor,
       _playerColor = playerColor,
       _size = AppSizing.markAppBar;

  /// [AppSizing.markSplash] — the splash lockup.
  const NineSquareMark.splash({
    required Color cpuColor,
    required Color outlineColor,
    required Color playerColor,
    super.key,
  }) : _asset = AppAssets.mark74,
       _cpuColor = cpuColor,
       _outlineColor = outlineColor,
       _playerColor = playerColor,
       _size = AppSizing.markSplash;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    _asset,
    colorMapper: _MarkColorMapper(cpu: _cpuColor, outline: _outlineColor, player: _playerColor),
    height: _size,
    width: _size,
  );
}

/// The artwork carries the dark palette literally, so each fill is remapped to the active theme.
/// The three are distinct, which is what makes keying on colour unambiguous.
class _MarkColorMapper extends ColorMapper {
  static const int _svgCpu = 0xFFFF8A6B;
  static const int _svgOutline = 0xFF23262C;
  static const int _svgPlayer = 0xFF6E9BFF;

  final Color cpu;
  final Color outline;
  final Color player;

  const _MarkColorMapper({required this.cpu, required this.outline, required this.player});

  @override
  Color substitute(String? id, String elementName, String attributeName, Color color) => switch (color.toARGB32()) {
    _svgCpu => cpu,
    _svgOutline => outline,
    _svgPlayer => player,
    _ => color,
  };
}
