/// Navigation port: the feature emits intents; composition turns them into navigation.
abstract interface class HistoryRouting {
  /// The player is done reading. This screen was pushed over a board it has never heard of, so
  /// what "back" means is not its to decide.
  void onDismissHistory();
}
