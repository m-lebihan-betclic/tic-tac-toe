import 'package:design_components/src/app_tokens.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// A label over a value: the score row's pairs, and the history stat cards.
///
/// Read-only, so there is no press treatment. A surface that reacts to touch and then does
/// nothing is worse than one that ignores it.
class AppStat extends StatelessWidget {
  final String label;

  /// Overrides the value's colour where a screen means something by it — a win count in
  /// [AppPalette.success], say. A zero is muted regardless: nothing has happened yet.
  final Color? accent;

  final String value;

  const AppStat({required this.label, required this.value, this.accent, super.key});

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color valueColor = accent ?? (value == _zero ? palette.onSurfaceMuted : palette.onSurface);

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: AppSpacing.spacing150,
      children: <Widget>[
        Text(label, style: context.typography.caption.copyWith(color: palette.onSurfaceMuted)),
        Text(value, style: context.typography.statValue.copyWith(color: valueColor)),
      ],
    );
  }

  static const String _zero = '0';
}
