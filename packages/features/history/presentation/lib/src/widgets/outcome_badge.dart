import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// The W · D · L chip at the end of a round's row.
///
/// One letter, outlined in the accent rather than filled with it: a filled badge at this size
/// would out-shout the sentence it belongs to, and the row is the thing being read.
class OutcomeBadge extends StatelessWidget {
  static const double _fontSize = 12;
  static const EdgeInsets _padding = EdgeInsets.symmetric(horizontal: 9, vertical: 5);

  final Color color;
  final String letter;
  final TextStyle style;

  const OutcomeBadge({required this.color, required this.letter, required this.style, super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: AppSizing.hairline),
      borderRadius: BorderRadius.circular(AppRadius.badge),
    ),
    child: Padding(
      padding: _padding,
      child: Text(
        letter,
        style: style.copyWith(color: color, fontSize: _fontSize, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
