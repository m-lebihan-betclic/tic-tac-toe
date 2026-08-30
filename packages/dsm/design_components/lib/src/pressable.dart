import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';

/// The press treatment, once, for every interactive surface in the package.
///
/// It owns the whole rule rather than handing a bool back to each component: the fill shifts over
/// [AppMotion.press], linearly, and nothing else moves. No ripple, no scale, no elevation, no
/// shadow — and no `InkWell`, no `Material`, no ink, so there is no splash to suppress and
/// `NoSplash.splashFactory` appears nowhere in the codebase.
///
/// Callers pass the two fills. Outlined and transparent surfaces pass [AppPalette.surfacePressed];
/// filled ones pass [AppPalette.pressedFill], which washes a fill with 12% of its own foreground
/// so it stays right in all three themes.
///
/// Not exported: it is how components are built, not something a feature composes with.
class Pressable extends StatefulWidget {
  final AlignmentGeometry? alignment;
  final BoxBorder? border;
  final BorderRadius borderRadius;
  final Widget child;
  final Color fill;
  final double? height;

  /// Null disables the surface outright — no callback and no press state, so something that looks
  /// disabled cannot still respond.
  final VoidCallback? onPressed;

  final Color pressedFill;

  const Pressable({
    required this.borderRadius,
    required this.child,
    required this.fill,
    required this.onPressed,
    required this.pressedFill,
    this.alignment,
    this.border,
    this.height,
    super.key,
  });

  @override
  State<Pressable> createState() => _PressableState();
}

class _PressableState extends State<Pressable> {
  bool _pressed = false;

  bool get _enabled => widget.onPressed != null;

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: widget.onPressed,
    onTapCancel: _enabled ? () => _setPressed(false) : null,
    onTapDown: _enabled ? (_) => _setPressed(true) : null,
    onTapUp: _enabled ? (_) => _setPressed(false) : null,
    child: AnimatedContainer(
      alignment: widget.alignment,
      decoration: BoxDecoration(
        border: widget.border,
        borderRadius: widget.borderRadius,
        color: _pressed ? widget.pressedFill : widget.fill,
      ),
      duration: AppMotion.press,
      height: widget.height,
      child: widget.child,
    ),
  );

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }
}
