import 'package:design_tokens/design_tokens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:l10n/l10n.dart';
import 'package:session_domain/session_domain.dart';
import 'package:settings_presentation/src/providers_di.br.dart';
import 'package:settings_presentation/src/theme/settings_theme.br.dart';

/// The `PLAYER` row: the nickname, edited where it is shown.
///
/// **Only the return key commits.** Losing focus any other way — a tap outside, the back gesture,
/// the keyboard being dismissed — puts the field back to the last committed name. That is the
/// whole interaction, and it is why this holds a `_committed` string rather than diffing against
/// the stored player: the revert has to be exact and immediate, and a provider written a
/// microsecond ago has not necessarily propagated yet.
///
/// It is feature-local rather than an `AppCardRow` variant because an editable row has one caller.
/// The row's geometry is shared, though, so it is the same [AppSizing.listRow] and the same
/// gutter — the card it sits in cannot tell the difference.
class NicknameRow extends ConsumerStatefulWidget {
  const NicknameRow({super.key});

  @override
  ConsumerState<NicknameRow> createState() => _NicknameRowState();
}

class _NicknameRowState extends ConsumerState<NicknameRow> {
  late final TextEditingController _controller = TextEditingController(text: _storedName);
  final FocusNode _focusNode = FocusNode();

  /// The last name that was actually saved. What the field reverts to.
  late String _committed = _storedName;

  String get _storedName => ref.read(playerProvider).name;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsTheme theme = ref.watch(settingsThemeProvider);

    return GestureDetector(
      // Opaque, and on the whole row: a 54px row is a comfortable target and the six characters
      // of `Change` are not. There is no pressed fill — the response to this tap is a keyboard.
      behavior: HitTestBehavior.opaque,
      onTap: _focusNode.requestFocus,
      child: SizedBox(
        height: AppSizing.listRow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing400),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _controller,
                  cursorColor: theme.cursorColor,
                  // No decoration at all: the card is the border, and a null decoration is also
                  // what suppresses Material's counter without having to blank its text.
                  decoration: null,
                  focusNode: _focusNode,
                  maxLength: Player.maxNameLength,
                  onSubmitted: _submit,
                  style: theme.nameStyle,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Text(context.l10n.settingsChange, style: theme.linkStyle),
            ],
          ),
        ),
      ),
    );
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) return;

    _controller.text = _committed;
  }

  /// The domain trims and caps, so the field is set to what was *stored* rather than to what was
  /// typed — otherwise a trailing space would survive on screen and nowhere else.
  ///
  /// An empty name is not an error to report. It is a change that was never made: the row goes
  /// back to the name it had, which is why this screen needs no error state and has none.
  void _submit(String value) {
    if (Player.create(value).getOrNull() case final Player player) {
      ref.read(savePlayerProvider)(player);
      _committed = player.name;
    }

    _focusNode.unfocus();
  }
}
