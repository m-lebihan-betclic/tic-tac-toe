import 'dart:async';

import 'package:game_domain/game_domain.dart';
import 'package:game_presentation/src/providers_di.br.dart';
import 'package:game_presentation/src/providers_internal.br.dart';
import 'package:game_presentation/src/state/game_ui_state.br.dart';
import 'package:game_presentation/src/state/status_banner.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';

part 'game_ui_state_notifier.br.g.dart';

/// Drives the board.
///
/// It calls behaviors and never a repository: if this file ever watches a repository provider,
/// the layering has gone wrong.
@riverpod
class GameUiStateNotifier extends _$GameUiStateNotifier {
  /// The CPU's thinking beat. Presentation, not a rule — the domain plays instantly.
  Timer? _beat;

  /// Every round finished this session. [Scores] is derived from it rather than counted
  /// alongside it, so the tally cannot drift from the history it summarises.
  final List<Round> _rounds = <Round>[];

  @override
  GameUiState build() {
    ref.onDispose(_cancelBeat);

    return GameUiState(
      banner: const StatusBanner.turn(),
      // Difficulty comes from the stored preference once there is one to read; until then a
      // session starts at the domain's own default.
      game: ref.read(startRoundProvider)(difficulty: Difficulty.initial),
      player: ref.watch(playerProvider),
      scores: const Scores(),
    );
  }

  /// Clears the board immediately, no confirmation. Enabled during the CPU's turn, which is
  /// exactly why the beat has to be cancellable.
  void reset() {
    _cancelBeat();
    state = state.copyWith(
      banner: const StatusBanner.cleared(),
      game: ref.read(resetRoundProvider)(state.game),
    );
  }

  void play(int slot) {
    ref
        .read(playMoveProvider)(state.game, slot)
        .fold(
          _advance,
          // Only a taken slot has anything to say. Out-of-turn and game-over taps are refused by
          // the domain and ignored here: the board is already inert, and telling someone off for
          // a tap the UI should not have delivered is noise.
          (MoveError error) => switch (error) {
            SlotTaken() => state = state.copyWith(banner: StatusBanner.invalid(slot: slot)),
            GameOver() || NotYourTurn() => null,
          },
        );
  }

  void _advance(Game game) {
    state = state.copyWith(banner: _bannerFor(game), game: game);

    switch (game.status) {
      case CpuTurn():
        _scheduleBeat(game);
      case Finished(:final GameOutcome outcome, :final Set<WinningLine> winningLines):
        _rounds.add(
          Round(
            difficulty: game.difficulty,
            moveCount: game.board.moveCount,
            outcome: outcome,
            winningLines: winningLines,
          ),
        );
        state = state.copyWith(scores: Scores.fromRounds(_rounds));
      case PlayerTurn():
        break;
    }
  }

  void _scheduleBeat(Game scheduledFor) {
    _cancelBeat();
    // Re-read per turn: a fixed pause reads as a timer, a varying one as somebody thinking.
    _beat = Timer(ref.read(cpuBeatProvider), () {
      // A reset landing mid-beat must not deliver the CPU's move to a board that no longer
      // exists. Identity, not equality: a reset produces a different object even when the two
      // boards would compare equal.
      if (!identical(state.game, scheduledFor)) return;

      ref.read(playCpuMoveProvider)(state.game).fold(_advance, (_) => null);
    });
  }

  void _cancelBeat() {
    _beat?.cancel();
    _beat = null;
  }

  StatusBanner _bannerFor(Game game) => switch (game.status) {
    CpuTurn() => const StatusBanner.thinking(),
    Finished(:final GameOutcome outcome) => StatusBanner.over(outcome: outcome),
    PlayerTurn() => const StatusBanner.turn(),
  };
}
