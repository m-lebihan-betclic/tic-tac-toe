import 'package:design_components/src/app_tokens.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// The selection mark on a card row: a `20×20` ring.
///
/// Selected is a `6px` [AppPalette.primary] border rather than a dot inside a ring — at this size
/// the border closes to a filled disc with a hairline of surface showing, which is the drawing,
/// and it is one box instead of two.
///
/// It draws and nothing else. The row owns the tap, because a 20px target is not one.
class AppRadio extends StatelessWidget {
  static const double _selectedBorderWidth = 6;
  static const double _size = 20;
  static const double _unselectedBorderWidth = 1.5;

  final bool selected;

  const AppRadio({required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return SizedBox.square(
      dimension: _size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? palette.primary : palette.outline,
            width: selected ? _selectedBorderWidth : _unselectedBorderWidth,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
