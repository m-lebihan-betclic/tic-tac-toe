import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:session_domain/session_domain.dart' as session_domain;
import 'package:setup_data/src/providers.br.dart';

/// Feeds the two session contracts this feature implements. History is not among them, and is
/// left unfed until the feature that renders it exists — an unfed contract throws when it is
/// read, which is the loud failure the design wants.
List<Override> bindProviders() => <Override>[
  ...session_domain.bindProviders(
    player: playerRepositoryProvider,
    preferences: preferencesRepositoryProvider,
  ),
];
