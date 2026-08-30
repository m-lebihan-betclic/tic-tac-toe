/// Navigation port: the feature emits intents; composition turns them into navigation.
///
/// One method, because there is only one thing this screen cannot answer for itself. The nickname
/// used to be the second — it opened the setup sheet — and is now edited in place, which took a
/// whole navigation away rather than moving it somewhere better.
abstract interface class SettingsRouting {
  /// The player is done here. Composition decides what "back" means — this screen is a
  /// full-screen route today and knows nothing about what it was pushed over.
  void onDismissSettings();
}
