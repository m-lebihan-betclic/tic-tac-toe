import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/src/behaviors/read_difficulty.dart';
import 'package:session_domain/src/behaviors/read_locale.dart';
import 'package:session_domain/src/behaviors/read_player.dart';
import 'package:session_domain/src/behaviors/read_rounds.dart';
import 'package:session_domain/src/behaviors/read_theme.dart';
import 'package:session_domain/src/behaviors/save_difficulty.dart';
import 'package:session_domain/src/behaviors/save_locale.dart';
import 'package:session_domain/src/behaviors/save_player.dart';
import 'package:session_domain/src/behaviors/save_round.dart';
import 'package:session_domain/src/behaviors/save_theme.dart';
import 'package:session_domain/src/entities/app_locale.dart';
import 'package:session_domain/src/entities/app_theme.dart';
import 'package:session_domain/src/entities/difficulty.dart';
import 'package:session_domain/src/entities/player.dart';
import 'package:session_domain/src/entities/round.br.dart';
import 'package:session_domain/src/entities/scores.br.dart';
import 'package:session_domain/src/providers_di.br.dart';
import 'package:session_domain/src/repositories/history_repository.dart';
import 'package:session_domain/src/repositories/player_repository.dart';
import 'package:session_domain/src/repositories/preferences_repository.dart';

part 'providers.br.g.dart';

/// Three contracts rather than one, because they have three reasons to change and three
/// independent seams: history is droppable, preferences outlive a round, and the player is
/// written from two different features. Composition can swap any one of them without touching
/// the others.
/// Each contract is fed independently, because they gain implementations at different times: the
/// setup sheet supplies the player and the preferences long before anything renders a history.
/// One left out still throws when it is read, so a missing implementation fails loudly rather
/// than silently returning nothing.
List<Override> bindProviders({
  ProviderListenable<HistoryRepository>? history,
  ProviderListenable<PlayerRepository>? player,
  ProviderListenable<PreferencesRepository>? preferences,
}) => <Override>[
  if (history != null) historyRepositoryProvider.overrideWith((ref) => ref.watch(history)),
  if (player != null) playerRepositoryProvider.overrideWith((ref) => ref.watch(player)),
  if (preferences != null) preferencesRepositoryProvider.overrideWith((ref) => ref.watch(preferences)),
];

// Reads expose the *result*; writes expose the bare `call`, because the caller invokes those
// later. A read exposed as a function would be called once and never hear about the next write.
//
// Public API: expose behaviors as providers — never the raw repository, never a behavior
// instance. A behavior provider returns either the *result* of calling it, or its bare `call`
// when the caller needs to invoke it later.
//
// This is what keeps presentation off the contracts: a feature reads a repository through these
// or not at all, and providers_di is never exported.

typedef SaveDifficultyFun = void Function(Difficulty difficulty);
typedef SaveLocaleFun = void Function(AppLocale locale);
typedef SavePlayerFun = void Function(Player player);
typedef SaveRoundFun = void Function(Round round);
typedef SaveThemeFun = void Function(AppTheme theme);

@riverpod
Difficulty? storedDifficulty(Ref ref) => ReadDifficulty(preferences: ref.watch(preferencesRepositoryProvider))();

@riverpod
AppLocale? storedLocale(Ref ref) => ReadLocale(preferences: ref.watch(preferencesRepositoryProvider))();

@riverpod
Player? storedPlayer(Ref ref) => ReadPlayer(player: ref.watch(playerRepositoryProvider))();

@riverpod
List<Round> storedRounds(Ref ref) => ReadRounds(history: ref.watch(historyRepositoryProvider))();

/// The tally, derived from the rounds rather than counted beside them.
///
/// Two counters that must agree can disagree, and a score that drifts from the history it
/// summarises is the kind of bug nothing catches. The board and the history screen read this same
/// provider, so they cannot disagree either.
@riverpod
Scores storedScores(Ref ref) => Scores.fromRounds(ref.watch(storedRoundsProvider));

@riverpod
AppTheme? storedTheme(Ref ref) => ReadTheme(preferences: ref.watch(preferencesRepositoryProvider))();

@riverpod
SaveDifficultyFun saveDifficulty(Ref ref) => SaveDifficulty(preferences: ref.watch(preferencesRepositoryProvider)).call;

@riverpod
SaveLocaleFun saveLocale(Ref ref) => SaveLocale(preferences: ref.watch(preferencesRepositoryProvider)).call;

@riverpod
SavePlayerFun savePlayer(Ref ref) => SavePlayer(player: ref.watch(playerRepositoryProvider)).call;

@riverpod
SaveRoundFun saveRound(Ref ref) => SaveRound(history: ref.watch(historyRepositoryProvider)).call;

@riverpod
SaveThemeFun saveTheme(Ref ref) => SaveTheme(preferences: ref.watch(preferencesRepositoryProvider)).call;
