import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:session_domain/session_domain.dart';

part 'status_banner.br.freezed.dart';

/// What the status block says.
///
/// The spec sketched a seven-variant union where every variant re-carried the board and the
/// scores. The observation was right — the widget tree really is identical across all of them —
/// but the shape was wrong: what varies is the status block, so the status block is the union
/// and the board exists once.
///
/// [Invalid] carries the offending slot, and two different lifetimes hang off it. The shake fires
/// **once, on the tap** — it reacts to an event. The ring and the message **persist** until the
/// next valid move, because they describe a condition that is still true. Neither is on a timer:
/// a warning that expires while the mistake is still on screen tells the player the problem went
/// away, and it had not.
@freezed
sealed class StatusBanner with _$StatusBanner {
  /// After a reset — still the player's turn, but the sentence says what just happened.
  const factory StatusBanner.cleared() = Cleared;

  const factory StatusBanner.invalid({required int slot}) = Invalid;

  const factory StatusBanner.over({required GameOutcome outcome}) = Over;

  const factory StatusBanner.thinking() = Thinking;

  const factory StatusBanner.turn() = Turn;
}
