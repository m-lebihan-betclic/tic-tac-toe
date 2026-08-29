/// Navigation port: the feature emits intents, outcomes and dismissals; the implementation on
/// the composition side turns them into concrete navigation.
///
/// Name methods after the **event** — `on…Requested`, `on…Successful`, `onDismiss…` — never
/// after the destination (`navigateTo…`, `push…`, which belong to the router) and never after
/// the gesture (`onTap…`, `on…Clicked`).
abstract interface class SplashRouting {
  /// The brand beat has elapsed. The splash does not know what follows it — composition does.
  void onSplashCompleted();
}
