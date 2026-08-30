import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_error.br.freezed.dart';

/// The three ways a move is refused.
///
/// A refused move is a value, not an exception. None of these is a bug: tapping a taken slot,
/// tapping during the CPU's beat, and tapping after the game ends are all things a player does.
/// An exception here would be a bug; a rejected move is Tuesday.
@freezed
sealed class MoveError with _$MoveError {
  const factory MoveError.gameOver() = GameOver;

  const factory MoveError.notYourTurn() = NotYourTurn;

  const factory MoveError.slotTaken() = SlotTaken;
}
