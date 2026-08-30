/// Navigation port: the feature emits intents; composition turns them into navigation.
abstract interface class SetupRouting {
  /// The player has a name and a level and wants to start. Composition decides whether that means
  /// dismissing a sheet over a board or returning to settings — the sheet does not know which of
  /// its two entry points it was opened from.
  void onSetupCompleted();
}
