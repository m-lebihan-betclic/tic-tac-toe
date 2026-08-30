import 'package:design_components/src/app_tokens.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// A one-pixel rule in [AppPalette.outline].
///
/// Inset to the gutter by default, because a divider between rows belongs to the content it
/// divides. The footer hairline is full-bleed: it separates the screen from its edge, not one row
/// from the next.
class AppSeparator extends StatelessWidget {
  final bool _inset;

  const AppSeparator({super.key}) : _inset = true;

  const AppSeparator.fullBleed({super.key}) : _inset = false;

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: _inset ? AppSpacing.gutter : 0),
    child: SizedBox(
      height: AppSizing.hairline,
      width: double.infinity,
      child: ColoredBox(color: context.palette.outline),
    ),
  );
}
