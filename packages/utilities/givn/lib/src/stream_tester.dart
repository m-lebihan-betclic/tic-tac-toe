import 'dart:async';

class StreamTester<T> {
  final List<T> values = [];
  StreamSubscription<T>? _subscription;

  void start(Stream<T> stream) {
    _subscription = stream.listen(values.add);
  }

  void dispose() {
    _subscription?.cancel();
  }
}
