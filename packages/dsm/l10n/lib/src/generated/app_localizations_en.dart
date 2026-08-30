// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tic-Tac-Toe';

  @override
  String get splashWordmark => 'TIC TAC TOE';

  @override
  String get splashTagline => 'Local play · vs CPU';

  @override
  String get setupTitle => 'Who\'s playing?';

  @override
  String get setupSubtitle => 'Pick a name.';

  @override
  String get setupStart => 'Start playing';

  @override
  String get labelTheme => 'THEME';

  @override
  String get labelLanguage => 'LANGUAGE';

  @override
  String get labelDifficulty => 'DIFFICULTY';

  @override
  String get difficultyEasy => 'Easy';

  @override
  String get difficultyHard => 'Hard';

  @override
  String get difficultyNote => 'Applies to the next round.';

  @override
  String get labelPlayer => 'PLAYER';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeMatrix => 'Matrix';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageFrench => 'Français';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsChange => 'Change';

  @override
  String get settingsFooter =>
      'Nothing here interrupts a game in progress. Theme and language apply at once; the difficulty applies to the next round.';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get labelYourTurn => 'YOUR TURN';

  @override
  String get labelCpu => 'CPU';

  @override
  String get labelTaken => 'TAKEN';

  @override
  String get labelGameOver => 'GAME OVER';

  @override
  String statusPlayerTurn(String name) {
    return 'Go on, $name.';
  }

  @override
  String get statusCpuTurn => 'Thinking…';

  @override
  String get errorSlotTaken => 'Pick an empty square.';

  @override
  String resultWon(String name) {
    return 'You got it, $name.';
  }

  @override
  String get resultLost => 'CPU takes it.';

  @override
  String get resultDraw => 'Draw. Nobody blinked.';

  @override
  String statusReset(String name) {
    return 'Your turn, $name.';
  }

  @override
  String get actionReset => 'Reset game';

  @override
  String get actionNewGame => 'New game';

  @override
  String get scoreYou => 'YOU';

  @override
  String get scoreCpu => 'CPU';

  @override
  String get scoreDraw => 'DRAW';

  @override
  String get historyTitle => 'This session';

  @override
  String get historyWon => 'WON';

  @override
  String get historyLost => 'LOST';

  @override
  String get historyDrawn => 'DRAWN';

  @override
  String get historyRounds => 'ROUNDS';

  @override
  String historyRoundWon(String line) {
    return 'Won · $line';
  }

  @override
  String historyRoundLost(String line) {
    return 'Lost · $line';
  }

  @override
  String historyRoundDrawn(int moves) {
    return 'Drawn · $moves moves';
  }

  @override
  String get historyEmpty => 'Nothing yet. Play a round.';

  @override
  String get historyFooter => 'Cleared when the app closes. No storage layer.';

  @override
  String get lineTopRow => 'top row';

  @override
  String get lineMiddleRow => 'middle row';

  @override
  String get lineBottomRow => 'bottom row';

  @override
  String get lineLeftColumn => 'left column';

  @override
  String get lineMiddleColumn => 'middle column';

  @override
  String get lineRightColumn => 'right column';

  @override
  String get lineDiagonalDown => 'diagonal';

  @override
  String get lineDiagonalUp => 'anti-diagonal';
}
