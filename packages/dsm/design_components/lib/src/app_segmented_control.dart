import 'package:design_components/src/app_tokens.dart';
import 'package:design_components/src/pressable.dart';
import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// One choice in an [AppSegmentedControl]. Generic over the value so the caller keeps its enum
/// and the control never learns what a `Difficulty` is.
@immutable
class AppSegment<T> {
  final String label;
  final T value;

  const AppSegment({required this.label, required this.value});
}

/// A row of equal segments, exactly one of them selected.
///
/// Selection arrives from outside, like the chip's: this renders what it is told and reports
/// taps. The segments are [Expanded], never a width divided by their count, so two long French
/// labels and two short English ones measure the same at any viewport.
///
/// The `1px` seams are the card's own [AppPalette.outline] showing through gaps between the
/// segments, not borders on each one — borders would double where two segments meet.
class AppSegmentedControl<T> extends StatelessWidget {
  final ValueChanged<T> onSelected;
  final T selected;
  final List<AppSegment<T>> segments;

  const AppSegmentedControl({
    required this.onSelected,
    required this.segments,
    required this.selected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return SizedBox(
      height: AppSizing.segmentedHeight,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: palette.outline, width: AppSizing.hairline),
          borderRadius: BorderRadius.circular(AppRadius.button),
          color: palette.outline,
        ),
        child: Row(
          spacing: AppSizing.hairline,
          children: <Widget>[
            for (final AppSegment<T> segment in segments)
              Expanded(
                child: _Segment<T>(onSelected: onSelected, segment: segment, selected: segment.value == selected),
              ),
          ],
        ),
      ),
    );
  }
}

class _Segment<T> extends StatelessWidget {
  static const double _labelSize = 15;

  final ValueChanged<T> onSelected;
  final bool selected;
  final AppSegment<T> segment;

  const _Segment({required this.onSelected, required this.segment, required this.selected});

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color fill = selected ? palette.primary : palette.surface;
    final Color foreground = selected ? palette.background : palette.onSurfaceMuted;

    return Semantics(
      button: true,
      label: segment.label,
      selected: selected,
      child: Pressable(
        alignment: Alignment.center,
        // Square, not rounded: the card clips the two outer corners to its own radius, and a
        // radius here would leave a crescent of outline showing inside each end.
        borderRadius: BorderRadius.zero,
        fill: fill,
        onPressed: () => onSelected(segment.value),
        // Filled surfaces wash with their own foreground; outlined ones go to surfacePressed.
        pressedFill: selected ? palette.pressedFill(fill, foreground) : palette.surfacePressed,
        child: Text(
          segment.label,
          overflow: TextOverflow.ellipsis,
          style: context.typography.body.copyWith(
            color: foreground,
            fontSize: _labelSize,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
