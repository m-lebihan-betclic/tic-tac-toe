import 'package:design_components/design_components.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// One of the three counters at the top: a number over its name.
///
/// Read-only, so no press treatment — a surface that reacts to touch and then does nothing is
/// worse than one that ignores it.
class StatCard extends StatelessWidget {
  static const double _padding = AppSpacing.spacing400;

  final Color accent;
  final String label;
  final TextStyle labelStyle;
  final String value;
  final TextStyle valueStyle;

  const StatCard({
    required this.accent,
    required this.label,
    required this.labelStyle,
    required this.value,
    required this.valueStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AppCard(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(_padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: AppSpacing.spacing250,
          children: <Widget>[
            Text(value, style: valueStyle.copyWith(color: accent)),
            Text(label, style: labelStyle),
          ],
        ),
      ),
    ],
  );
}
