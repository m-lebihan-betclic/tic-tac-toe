import 'package:session_domain/src/entities/app_locale.dart';
import 'package:session_domain/src/entities/app_theme.dart';
import 'package:session_domain/src/entities/difficulty.dart';

/// What the player chose. The "how" lives in the data layer.
///
/// Every read is nullable, including [readDifficulty], which has a perfectly good default in
/// `Difficulty.initial`. Storage stores; deciding what an absent value means is the domain's job,
/// and a repository that quietly substitutes a default cannot tell "unset" from "chosen".
/// That distinction is load-bearing: theme falls back to the platform brightness only while
/// nothing has been chosen.
abstract interface class PreferencesRepository {
  Difficulty? readDifficulty();

  AppLocale? readLocale();

  AppTheme? readTheme();

  void writeDifficulty(Difficulty difficulty);

  void writeLocale(AppLocale locale);

  void writeTheme(AppTheme theme);
}
