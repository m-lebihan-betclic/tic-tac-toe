import 'package:design_components/src/app_tokens.dart';
import 'package:design_components/src/pressable.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// A selectable chip, with an optional colour swatch.
///
/// Selection arrives from outside: the chip renders what it is told and reports taps. Holding the
/// choice here would put one screen's state inside a shared component, and the setup sheet and
/// settings disagree about what a selection even means.
class AppChip extends StatelessWidget {
  static const double _swatchSize = 11;
  static const double _swatchGap = AppSpacing.spacing150;
  static const double _labelSize = 12;
  static const double _swatchGlowRadius = 6;

  final String label;
  final VoidCallback onPressed;
  final bool selected;

  /// A literal preview of what the choice looks like — the theme chips show their own background.
  final Color? swatch;

  /// The swatch's 1px inset. It is what keeps a near-black square legible on a dark chip and a
  /// near-white one legible on a light chip.
  final Color? swatchBorder;

  /// Matrix only: the phosphor glow that makes it read as itself rather than as a black square.
  final Color? swatchGlow;

  const AppChip({
    required this.label,
    required this.onPressed,
    required this.selected,
    this.swatch,
    this.swatchBorder,
    this.swatchGlow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color fill = selected ? palette.primary : palette.surface;
    final Color foreground = selected ? palette.background : palette.onSurfaceMuted;

    return Semantics(
      button: true,
      label: label,
      selected: selected,
      child: SizedBox(
        height: AppSizing.chipHeight,
        child: Pressable(
          alignment: Alignment.center,
          border: Border.all(
            color: selected ? palette.primary : palette.outline,
            width: AppSizing.hairline,
          ),
          borderRadius: BorderRadius.circular(AppRadius.chip),
          fill: fill,
          onPressed: onPressed,
          // Filled surfaces wash with their own foreground; outlined ones go to surfacePressed.
          pressedFill: selected ? palette.pressedFill(fill, foreground) : palette.surfacePressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: _swatchGap,
            children: <Widget>[
              if (swatch != null)
                SizedBox.square(
                  dimension: _swatchSize,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: swatchBorder ?? palette.outline,
                        width: AppSizing.hairline,
                      ),
                      borderRadius: BorderRadius.circular(AppRadius.square),
                      boxShadow: swatchGlow == null
                          ? null
                          : <BoxShadow>[
                              BoxShadow(blurRadius: _swatchGlowRadius, color: swatchGlow!),
                            ],
                      color: swatch,
                    ),
                  ),
                ),
              // Scaled down rather than clipped or ellipsised. Three chips share a row inside
              // the gutter, so the slot narrows with the viewport while the word does not — and
              // on a theme chip the word *is* the content, so `Matr…` would be worse than a
              // slightly smaller `Matrix`. Nothing scales until it has to.
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    style: context.typography.bold.copyWith(color: foreground, fontSize: _labelSize),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
