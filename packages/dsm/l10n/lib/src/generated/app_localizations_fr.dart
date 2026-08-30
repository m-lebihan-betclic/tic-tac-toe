// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Morpion';

  @override
  String get splashWordmark => 'MORPION';

  @override
  String get splashTagline => 'Partie locale · contre le CPU';

  @override
  String get setupTitle => 'Qui joue ?';

  @override
  String get setupSubtitle => 'Choisis un nom.';

  @override
  String get setupStart => 'Commencer';

  @override
  String get labelTheme => 'THÈME';

  @override
  String get labelLanguage => 'LANGUE';

  @override
  String get labelDifficulty => 'DIFFICULTÉ';

  @override
  String get difficultyEasy => 'Facile';

  @override
  String get difficultyHard => 'Difficile';

  @override
  String get difficultyNote => 'S\'applique à la manche suivante.';

  @override
  String get labelPlayer => 'JOUEUR';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get themeMatrix => 'Matrix';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get settingsTitle => 'Réglages';

  @override
  String get settingsChange => 'Modifier';

  @override
  String get settingsFooter =>
      'Rien ici n\'interrompt une partie en cours. Le thème et la langue s\'appliquent aussitôt ; la difficulté s\'applique à la manche suivante.';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get labelYourTurn => 'À TOI';

  @override
  String get labelCpu => 'CPU';

  @override
  String get labelTaken => 'OCCUPÉE';

  @override
  String get labelGameOver => 'PARTIE TERMINÉE';

  @override
  String statusPlayerTurn(String name) {
    return 'À toi, $name.';
  }

  @override
  String get statusCpuTurn => 'Réflexion…';

  @override
  String get errorSlotTaken => 'Choisis une case libre.';

  @override
  String resultWon(String name) {
    return 'Bien joué, $name.';
  }

  @override
  String get resultLost => 'Le CPU l\'emporte.';

  @override
  String get resultDraw => 'Match nul.';

  @override
  String statusReset(String name) {
    return 'À toi, $name.';
  }

  @override
  String get actionReset => 'Recommencer';

  @override
  String get actionNewGame => 'Nouvelle partie';

  @override
  String get scoreYou => 'TOI';

  @override
  String get scoreCpu => 'CPU';

  @override
  String get scoreDraw => 'NULS';

  @override
  String get historyTitle => 'Cette session';

  @override
  String get historyWon => 'GAGNÉES';

  @override
  String get historyLost => 'PERDUES';

  @override
  String get historyDrawn => 'NULLES';

  @override
  String get historyRounds => 'PARTIES';

  @override
  String historyRoundWon(String line) {
    return 'Gagnée · $line';
  }

  @override
  String historyRoundLost(String line) {
    return 'Perdue · $line';
  }

  @override
  String historyRoundDrawn(int moves) {
    return 'Nulle · $moves coups';
  }

  @override
  String get historyEmpty => 'Rien pour l\'instant. Lance une partie.';

  @override
  String get historyFooter => 'Effacé à la fermeture de l\'app. Aucune persistance.';

  @override
  String get lineTopRow => 'ligne du haut';

  @override
  String get lineMiddleRow => 'ligne du milieu';

  @override
  String get lineBottomRow => 'ligne du bas';

  @override
  String get lineLeftColumn => 'colonne de gauche';

  @override
  String get lineMiddleColumn => 'colonne du milieu';

  @override
  String get lineRightColumn => 'colonne de droite';

  @override
  String get lineDiagonalDown => 'diagonale descendante';

  @override
  String get lineDiagonalUp => 'diagonale montante';
}
