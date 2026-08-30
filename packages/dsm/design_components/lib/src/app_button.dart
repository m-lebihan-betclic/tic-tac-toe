import 'package:design_components/src/app_tokens.dart';
import 'package:design_components/src/pressable.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

enum _Variant { primary, secondary }

/// The full-width action button, in two variants.
///
/// Disabled is 40% opacity **and** a null `onPressed`. Either alone is a bug: one looks
/// unavailable while still firing, the other refuses silently while looking ready.
class AppButton extends StatelessWidget {
  static const double _disabledOpacity = 0.4;
  static const double _secondaryBorderWidth = 1.5;

  final String label;
  final VoidCallback? onPressed;
  final _Variant _variant;

  /// `primary` fill, [AppPalette.background] text — the same pairing selected chips and segments
  /// use, so one filled surface never reads differently from another.
  const AppButton.primary({required this.label, required this.onPressed, super.key}) : _variant = _Variant.primary;

  /// Transparent, outlined. Never used for the action a screen is about.
  const AppButton.secondary({required this.label, required this.onPressed, super.key}) : _variant = _Variant.secondary;

  bool get _enabled => onPressed != null;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color fill = switch (_variant) {
      _Variant.primary => palette.primary,
      _Variant.secondary => const Color(0x00000000),
    };
    final Color foreground = switch (_variant) {
      _Variant.primary => palette.background,
      _Variant.secondary => palette.onSurface,
    };
    // Filled surfaces wash with 12% of their own foreground; outlined and transparent ones go to
    // surfacePressed. Derived rather than tokenised, so it stays right in all three themes.
    final Color pressedFill = switch (_variant) {
      _Variant.primary => palette.pressedFill(fill, foreground),
      _Variant.secondary => palette.surfacePressed,
    };

    return Semantics(
      button: true,
      enabled: _enabled,
      label: label,
      child: Opacity(
        opacity: _enabled ? 1 : _disabledOpacity,
        child: Pressable(
          alignment: Alignment.center,
          border: _variant == _Variant.secondary
              ? Border.all(color: palette.outline, width: _secondaryBorderWidth)
              : null,
          borderRadius: BorderRadius.circular(AppRadius.button),
          fill: fill,
          height: AppSizing.buttonHeight,
          onPressed: onPressed,
          pressedFill: pressedFill,
          child: Text(label, style: context.typography.bold.copyWith(color: foreground)),
        ),
      ),
    );
  }
}
