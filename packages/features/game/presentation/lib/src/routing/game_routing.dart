/// Navigation port: the feature emits intents, outcomes and dismissals; the implementation on
/// the composition side turns them into concrete navigation.
///
/// Named after the **event**, never the destination and never the gesture. `navigateToSettings`
/// would put stack policy in the feature; `onSettingsTapped` would describe a finger rather than
/// an intent. The board does not know Settings exists, and that is the point.
abstract interface class GameRouting {
  void onHistoryRequested();

  void onSettingsRequested();
}
