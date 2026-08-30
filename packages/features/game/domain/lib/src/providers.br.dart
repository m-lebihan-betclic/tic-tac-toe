import 'package:game_domain/src/behaviors/play_move.dart';
import 'package:game_domain/src/behaviors/reset_round.dart';
import 'package:game_domain/src/behaviors/start_round.dart';
import 'package:game_domain/src/entities/game.br.dart';
import 'package:game_domain/src/entities/move_error.br.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart';
import 'package:types_result_domain/types_result_domain.dart';

part 'providers.br.g.dart';

/// Nothing to feed. The rules fetch nothing and store nothing, so this feature has no incoming
/// contracts — a domain layer with no repository is a perfectly good domain layer, and the brick
/// that generated one was offering a template rather than an instruction.
List<Override> bindProviders() => const <Override>[];

typedef PlayMoveFun = Result<Game, MoveError> Function(Game game, int slot);
typedef ResetRoundFun = Game Function(Game game);
typedef StartRoundFun = Game Function({required Difficulty difficulty});

// Public API: the *result* of a behavior, or its bare `call` when the caller invokes it later.
// Never a behavior instance, and never a repository.

@riverpod
PlayMoveFun playMove(Ref ref) => const PlayMove().call;

@riverpod
ResetRoundFun resetRound(Ref ref) => const ResetRound().call;

@riverpod
StartRoundFun startRound(Ref ref) => const StartRound().call;
