import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session_domain/session_domain.dart';
import 'package:setup_presentation/src/notifiers/setup_form_notifier.br.dart';
import 'package:setup_presentation/src/providers_di.br.dart';
import 'package:setup_presentation/src/theme/setup_theme.br.dart';

/// The name input, with its own counter.
///
/// Material's counter is suppressed and drawn here instead: there is no error state to show,
/// because the field cannot exceed the cap, so a counter that turns [SetupTheme.counterFullColor]
/// at the limit is the whole feedback.
class NicknameField extends ConsumerStatefulWidget {
  const NicknameField({super.key});

  @override
  ConsumerState<NicknameField> createState() => _NicknameFieldState();
}

class _NicknameFieldState extends ConsumerState<NicknameField> {
  late final TextEditingController _controller = TextEditingController(
    text: ref.read(setupFormProvider).name,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SetupTheme theme = ref.watch(setupThemeProvider);
    final int length = ref.watch(setupFormProvider.select((s) => s.name.trim().length));
    final bool isFull = length >= Player.maxNameLength;

    return SizedBox(
      height: AppSizing.inputHeight,
      child: TextField(
        controller: _controller,
        maxLength: Player.maxNameLength,
        onChanged: ref.read(setupFormProvider.notifier).nameChanged,
        style: theme.fieldStyle,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          border: _border(theme.fieldBorderColor),
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing400),
          counterText: '',
          enabledBorder: _border(theme.fieldBorderColor),
          fillColor: theme.fieldFillColor,
          filled: true,
          focusedBorder: _border(theme.fieldFocusedBorderColor),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: AppSpacing.spacing400),
            child: Align(
              alignment: Alignment.centerRight,
              widthFactor: 1,
              child: Text(
                '$length/${Player.maxNameLength}',
                style: theme.labelStyle.copyWith(
                  color: isFull ? theme.counterFullColor : theme.counterColor,
                  fontSize: _counterFontSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppRadius.card),
    borderSide: BorderSide(color: color, width: _borderWidth),
  );

  static const double _borderWidth = 1.5;
  static const double _counterFontSize = 13;
}
