import 'package:design_components/src/app_tokens.dart';
import 'package:design_components/src/pressable.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// One row inside an `AppCard`: a label on the left, something on the right.
///
/// The trailing slot is a widget rather than a fixed set of options, because callers want
/// different things there — a radio in the theme list, a W/D/L badge in the round list — and the
/// row's job is the height, the gutter and the press treatment, not what it happens to be
/// trailing.
class AppCardRow extends StatelessWidget {
  /// Weight, not colour: the selected row in a list reads w500 against w400 neighbours. Colour is
  /// left to the trailing widget, so the labels stay one column of the same ink.
  final bool emphasized;

  final String label;

  /// Null leaves the row read-only — no press state, because nothing happens.
  final VoidCallback? onPressed;

  final Widget? trailing;

  const AppCardRow({
    required this.label,
    required this.onPressed,
    this.emphasized = false,
    this.trailing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Semantics(
      button: onPressed != null,
      label: label,
      child: Pressable(
        borderRadius: BorderRadius.zero,
        fill: palette.surface,
        height: AppSizing.listRow,
        onPressed: onPressed,
        pressedFill: palette.surfacePressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing400),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.body.copyWith(
                    color: palette.onSurface,
                    fontWeight: emphasized ? FontWeight.w500 : FontWeight.w400,
                  ),
                ),
              ),
              if (trailing case final Widget trailing) trailing,
            ],
          ),
        ),
      ),
    );
  }
}
