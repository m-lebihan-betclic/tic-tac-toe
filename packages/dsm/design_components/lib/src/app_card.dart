import 'package:design_components/src/app_separator.dart';
import 'package:design_components/src/app_tokens.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// The grouped card every settings and history section sits in: [AppPalette.surface], a hairline
/// outline, and an [AppRadius.card] corner.
///
/// It owns the dividers rather than each row drawing its own bottom border, which is what makes
/// the last row's edge correct for free — a row cannot know whether it is last, and a card that
/// clips to its radius would cut a trailing divider in half anyway.
class AppCard extends StatelessWidget {
  final List<Widget> children;

  const AppCard({required this.children, super.key});

  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      border: Border.all(color: context.palette.outline, width: AppSizing.hairline),
      borderRadius: BorderRadius.circular(AppRadius.card),
      color: context.palette.surface,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int index = 0; index < children.length; index++) ...<Widget>[
          if (index > 0) const AppSeparator.fullBleed(),
          children[index],
        ],
      ],
    ),
  );
}
