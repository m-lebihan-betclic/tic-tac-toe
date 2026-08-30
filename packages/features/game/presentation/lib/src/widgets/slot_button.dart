import 'dart:math' as math;

import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/notifiers/game_ui_state_notifier.br.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:game_presentation/src/theme/game_theme.br.dart';
import 'package:game_presentation/src/widgets/marks.dart';

/// One cell.
///
/// It watches its own slot and nothing else, so a move rebuilds one cell rather than nine. The
/// board above it must not watch the whole state either, or that saving is thrown away.
class SlotButton extends ConsumerWidget {
  static const double _invalidRingWidth = 2;
  static const double _pressedDotDiameter = 14;

  final int slot;

  const SlotButton({required this.slot, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Mark? mark = ref.watch(gameUiStateProvider.select((s) => s.game.board.markAt(slot)));
    final bool isInvalid = ref.watch(
      gameUiStateProvider.select((s) => s.banner is Invalid && (s.banner as Invalid).slot == slot),
    );
    final bool isInteractive = ref.watch(gameUiStateProvider.select((s) => s.isInteractive));
    final GameTheme theme = ref.watch(gameThemeProvider);

    return _ShakeOnInvalid(
      isInvalid: isInvalid,
      child: _Cell(
        isInteractive: isInteractive,
        mark: mark,
        onPressed: isInteractive ? () => ref.read(gameUiStateProvider.notifier).play(slot) : null,
        ringColor: isInvalid ? theme.warningColor : null,
        theme: theme,
      ),
    );
  }
}

class _Cell extends StatefulWidget {
  final bool isInteractive;
  final Mark? mark;
  final VoidCallback? onPressed;
  final Color? ringColor;
  final GameTheme theme;

  const _Cell({
    required this.isInteractive,
    required this.mark,
    required this.onPressed,
    required this.ringColor,
    required this.theme,
  });

  @override
  State<_Cell> createState() => _CellState();
}

class _CellState extends State<_Cell> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final GameTheme theme = widget.theme;
    final bool showPressed = _pressed && widget.mark == null;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onPressed,
      onTapCancel: widget.onPressed == null ? null : () => _setPressed(false),
      onTapDown: widget.onPressed == null ? null : (_) => _setPressed(true),
      onTapUp: widget.onPressed == null ? null : (_) => _setPressed(false),
      child: AnimatedContainer(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: widget.ringColor == null
              ? null
              : Border.all(color: widget.ringColor!, width: SlotButton._invalidRingWidth),
          color: showPressed ? theme.cellPressedColor : theme.cellColor,
        ),
        duration: AppMotion.press,
        child: switch (widget.mark) {
          Mark.o => CpuMark(color: theme.markCpuColor),
          Mark.x => PlayerMark(color: theme.markPlayerColor),
          null =>
            showPressed
                ? SizedBox.square(
                    dimension: SlotButton._pressedDotDiameter,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.pressedDotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
        },
      ),
    );
  }

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }
}

/// Fires once when the cell becomes invalid, and never again until it stops being invalid.
///
/// The shake is a reaction to an event; the ring and the message are a condition. Conflating them
/// is the easy mistake — a shake that repeats says the mistake happened again, and it did not.
class _ShakeOnInvalid extends StatefulWidget {
  final Widget child;
  final bool isInvalid;

  const _ShakeOnInvalid({required this.child, required this.isInvalid});

  @override
  State<_ShakeOnInvalid> createState() => _ShakeOnInvalidState();
}

class _ShakeOnInvalidState extends State<_ShakeOnInvalid> with SingleTickerProviderStateMixin {
  static const double _amplitude = 6;
  static const int _cycles = 3;

  late final AnimationController _controller = AnimationController(
    duration: AppMotion.invalidShake,
    vsync: this,
  );

  @override
  void didUpdateWidget(_ShakeOnInvalid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isInvalid && !oldWidget.isInvalid) _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, child) => Transform.translate(
      offset: Offset(
        math.sin(_controller.value * _cycles * 2 * math.pi) * _amplitude * (1 - _controller.value),
        0,
      ),
      child: child,
    ),
    child: widget.child,
  );
}
