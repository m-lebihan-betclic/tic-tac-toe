import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The nine-square mark at splash size.
///
/// Feature-local for now. It becomes `NineSquareMark` in `design_components` when the game
/// screen needs the same geometry at [AppSizing.markAppBar].
class SplashMark extends StatelessWidget {
  final Color cpuColor;
  final Color outlineColor;
  final Color playerColor;

  const SplashMark({
    required this.cpuColor,
    required this.outlineColor,
    required this.playerColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    AppAssets.mark74,
    colorMapper: _MarkColorMapper(cpu: cpuColor, outline: outlineColor, player: playerColor),
    height: AppSizing.markSplash,
    width: AppSizing.markSplash,
  );
}

/// The artwork carries the dark palette literally, so each fill is remapped to the active
/// theme. The three are distinct, which is what makes keying on colour unambiguous.
class _MarkColorMapper extends ColorMapper {
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

  static const int _svgCpu = 0xFFFF8A6B;
  static const int _svgOutline = 0xFF23262C;
  static const int _svgPlayer = 0xFF6E9BFF;
}
