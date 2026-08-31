import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The `×` in the header button, from `icon_close_16.svg`.
///
/// The same drawing settings uses. It is duplicated rather than shared because a component earns
/// a place in `design_components` by having a second caller *and* a stable API, and two ten-line
/// widgets that tint one asset are cheaper than the coordination.
class CloseGlyph extends StatelessWidget {
  final Color color;

  const CloseGlyph({required this.color, super.key});

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    AppAssets.iconClose,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    height: AppSizing.glyph,
    width: AppSizing.glyph,
  );
}
