import 'package:meta/meta.dart';
import 'package:types_result_domain/types_result_domain.dart';

/// The player's nickname, and the three rules that make one valid.
///
/// The rules live here rather than in the text field. `maxLength: 12` on the input is a
/// convenience; the domain restates its own invariant rather than trusting the UI, because the
/// setup sheet is not the only thing that will ever construct a [Player].
///
/// Validation is synchronous and safe to run on every keystroke. Debouncing buys time back when
/// the work is expensive, and measuring a twelve-character string is free.
@immutable
class Player {
  /// The cap the input mirrors with `maxLength`.
  static const int maxNameLength = 12;

  final String name;

  const Player._(this.name);

  /// Trims, rejects what is empty once trimmed, then truncates to [maxNameLength].
  ///
  /// A rejected nickname is a *value*, not an exception: an empty field is the state the setup
  /// sheet opens in, which makes it ordinary rather than a programming error. The signature
  /// forces the caller to handle it.
  static Result<Player, PlayerError> create(String name) {
    final String trimmed = name.trim();
    if (trimmed.isEmpty) {
      return const Failure<Player, PlayerError>(PlayerError.empty);
    }

    final String capped = trimmed.length <= maxNameLength ? trimmed : trimmed.substring(0, maxNameLength);

    return Success<Player, PlayerError>(Player._(capped));
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) => other is Player && other.name == name;

  @override
  String toString() => 'Player($name)';
}

/// The only way a nickname can be rejected. Too long is not a failure — it is truncated.
enum PlayerError { empty }
