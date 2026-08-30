import 'package:design_components/src/app_tokens.dart';
import 'package:design_components/src/pressable.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// A `36×36` outlined tap target holding a `16×16` glyph.
///
/// The glyph arrives as a child rather than as an icon name: the app draws its own — three bars
/// for history, a ring for settings — and none of them is a font glyph. Fixing the box at
/// [AppSizing.glyph] is what makes buttons carrying different drawings read as the same size.
class AppIconButton extends StatelessWidget {
  final Widget glyph;

  /// Spoken by a screen reader in place of the drawing, which has nothing to read.
  final String semanticLabel;

  final VoidCallback? onPressed;

  const AppIconButton({
    required this.glyph,
    required this.onPressed,
    required this.semanticLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: semanticLabel,
      child: SizedBox.square(
        dimension: AppSizing.iconButton,
        child: Pressable(
          alignment: Alignment.center,
          border: Border.all(color: palette.outline, width: AppSizing.hairline),
          borderRadius: BorderRadius.circular(AppRadius.iconButton),
          fill: const Color(0x00000000),
          onPressed: onPressed,
          pressedFill: palette.surfacePressed,
          child: SizedBox.square(
            dimension: AppSizing.glyph,
            child: Center(child: glyph),
          ),
        ),
      ),
    );
  }
}
