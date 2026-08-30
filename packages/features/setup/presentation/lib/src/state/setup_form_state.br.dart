import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:session_domain/session_domain.dart';

part 'setup_form_state.br.freezed.dart';

/// What the sheet has been told so far.
@freezed
abstract class SetupFormState with _$SetupFormState {
  const factory SetupFormState({
    required Difficulty difficulty,
    required String name,

    /// Null until a chip is tapped, which is what lets the sheet open wearing the platform's own
    /// light or dark rather than a stored choice nobody has made yet.
    AppTheme? theme,
  }) = _SetupFormState;

  const SetupFormState._();

  /// The domain decides, not the field: `maxLength` on the input is a convenience, and this is
  /// the same rule the player will be built with on submit.
  bool get canStart => Player.create(name).isSuccess();
}
