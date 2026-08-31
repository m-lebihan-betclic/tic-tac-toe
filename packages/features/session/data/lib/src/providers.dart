import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_data/src/providers.br.dart';
import 'package:session_domain/session_domain.dart' as session_domain;

/// Feeds all three session contracts. One store answers them, because they are one session: the
/// player, what they chose, and what they have played.
List<Override> bindProviders() => <Override>[
  ...session_domain.bindProviders(
    history: historyRepositoryProvider,
    player: playerRepositoryProvider,
    preferences: preferencesRepositoryProvider,
  ),
];
