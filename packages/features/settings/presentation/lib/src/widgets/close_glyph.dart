import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The `×` in the header button, from `icon_close_16.svg`.
///
/// It was a text `×` before the asset shipped, which sat a hair off centre and moved between the
/// sans and the mono themes. The artwork strokes in `currentColor`, so one colour filter tints it.
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
