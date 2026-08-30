import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('fr')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Tic-Tac-Toe'**
  String get appTitle;

  /// The splash wordmark. Set as drawn: uppercase and unhyphenated, not a transform of appTitle.
  ///
  /// In en, this message translates to:
  /// **'TIC TAC TOE'**
  String get splashWordmark;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Local play · vs CPU'**
  String get splashTagline;

  /// No description provided for @setupTitle.
  ///
  /// In en, this message translates to:
  /// **'Who\'s playing?'**
  String get setupTitle;

  /// No description provided for @setupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick a name.'**
  String get setupSubtitle;

  /// No description provided for @setupStart.
  ///
  /// In en, this message translates to:
  /// **'Start playing'**
  String get setupStart;

  /// No description provided for @labelTheme.
  ///
  /// In en, this message translates to:
  /// **'THEME'**
  String get labelTheme;

  /// No description provided for @labelLanguage.
  ///
  /// In en, this message translates to:
  /// **'LANGUAGE'**
  String get labelLanguage;

  /// No description provided for @labelDifficulty.
  ///
  /// In en, this message translates to:
  /// **'DIFFICULTY'**
  String get labelDifficulty;

  /// No description provided for @difficultyEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get difficultyEasy;

  /// No description provided for @difficultyHard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get difficultyHard;

  /// No description provided for @difficultyNote.
  ///
  /// In en, this message translates to:
  /// **'Applies to the next round.'**
  String get difficultyNote;

  /// No description provided for @labelPlayer.
  ///
  /// In en, this message translates to:
  /// **'PLAYER'**
  String get labelPlayer;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeMatrix.
  ///
  /// In en, this message translates to:
  /// **'Matrix'**
  String get themeMatrix;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get languageFrench;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get settingsChange;

  /// No description provided for @settingsFooter.
  ///
  /// In en, this message translates to:
  /// **'Version {version} · Changing theme or language never interrupts a game in progress.'**
  String settingsFooter(String version);

  /// No description provided for @labelYourTurn.
  ///
  /// In en, this message translates to:
  /// **'YOUR TURN'**
  String get labelYourTurn;

  /// No description provided for @labelCpu.
  ///
  /// In en, this message translates to:
  /// **'CPU'**
  String get labelCpu;

  /// No description provided for @labelTaken.
  ///
  /// In en, this message translates to:
  /// **'TAKEN'**
  String get labelTaken;

  /// No description provided for @labelGameOver.
  ///
  /// In en, this message translates to:
  /// **'GAME OVER'**
  String get labelGameOver;

  /// No description provided for @statusPlayerTurn.
  ///
  /// In en, this message translates to:
  /// **'Go on, {name}.'**
  String statusPlayerTurn(String name);

  /// No description provided for @statusCpuTurn.
  ///
  /// In en, this message translates to:
  /// **'Thinking…'**
  String get statusCpuTurn;

  /// No description provided for @errorSlotTaken.
  ///
  /// In en, this message translates to:
  /// **'Pick an empty square.'**
  String get errorSlotTaken;

  /// No description provided for @resultWon.
  ///
  /// In en, this message translates to:
  /// **'You got it, {name}.'**
  String resultWon(String name);

  /// No description provided for @resultLost.
  ///
  /// In en, this message translates to:
  /// **'CPU takes it.'**
  String get resultLost;

  /// No description provided for @resultDraw.
  ///
  /// In en, this message translates to:
  /// **'Draw. Nobody blinked.'**
  String get resultDraw;

  /// No description provided for @statusReset.
  ///
  /// In en, this message translates to:
  /// **'Your turn, {name}.'**
  String statusReset(String name);

  /// No description provided for @actionReset.
  ///
  /// In en, this message translates to:
  /// **'Reset game'**
  String get actionReset;

  /// No description provided for @actionNewGame.
  ///
  /// In en, this message translates to:
  /// **'New game'**
  String get actionNewGame;

  /// No description provided for @scoreYou.
  ///
  /// In en, this message translates to:
  /// **'YOU'**
  String get scoreYou;

  /// No description provided for @scoreCpu.
  ///
  /// In en, this message translates to:
  /// **'CPU'**
  String get scoreCpu;

  /// No description provided for @scoreDraw.
  ///
  /// In en, this message translates to:
  /// **'DRAW'**
  String get scoreDraw;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'This session'**
  String get historyTitle;

  /// No description provided for @historyWon.
  ///
  /// In en, this message translates to:
  /// **'WON'**
  String get historyWon;

  /// No description provided for @historyLost.
  ///
  /// In en, this message translates to:
  /// **'LOST'**
  String get historyLost;

  /// No description provided for @historyDrawn.
  ///
  /// In en, this message translates to:
  /// **'DRAWN'**
  String get historyDrawn;

  /// No description provided for @historyRounds.
  ///
  /// In en, this message translates to:
  /// **'ROUNDS'**
  String get historyRounds;

  /// No description provided for @historyRoundWon.
  ///
  /// In en, this message translates to:
  /// **'Won · {line}'**
  String historyRoundWon(String line);

  /// No description provided for @historyRoundLost.
  ///
  /// In en, this message translates to:
  /// **'Lost · {line}'**
  String historyRoundLost(String line);

  /// No description provided for @historyRoundDrawn.
  ///
  /// In en, this message translates to:
  /// **'Drawn · {moves} moves'**
  String historyRoundDrawn(int moves);

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing yet. Play a round.'**
  String get historyEmpty;

  /// No description provided for @historyFooter.
  ///
  /// In en, this message translates to:
  /// **'Cleared when the app closes. No storage layer.'**
  String get historyFooter;

  /// No description provided for @lineTopRow.
  ///
  /// In en, this message translates to:
  /// **'top row'**
  String get lineTopRow;

  /// No description provided for @lineMiddleRow.
  ///
  /// In en, this message translates to:
  /// **'middle row'**
  String get lineMiddleRow;

  /// No description provided for @lineBottomRow.
  ///
  /// In en, this message translates to:
  /// **'bottom row'**
  String get lineBottomRow;

  /// No description provided for @lineLeftColumn.
  ///
  /// In en, this message translates to:
  /// **'left column'**
  String get lineLeftColumn;

  /// No description provided for @lineMiddleColumn.
  ///
  /// In en, this message translates to:
  /// **'middle column'**
  String get lineMiddleColumn;

  /// No description provided for @lineRightColumn.
  ///
  /// In en, this message translates to:
  /// **'right column'**
  String get lineRightColumn;

  /// No description provided for @lineDiagonalDown.
  ///
  /// In en, this message translates to:
  /// **'diagonal'**
  String get lineDiagonalDown;

  /// No description provided for @lineDiagonalUp.
  ///
  /// In en, this message translates to:
  /// **'anti-diagonal'**
  String get lineDiagonalUp;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
