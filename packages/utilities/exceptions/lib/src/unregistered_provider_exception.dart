class UnregisteredProviderException implements Exception {
  UnregisteredProviderException(this.provider);

  /// The generated provider that should be implemented by the app.
  final dynamic provider;

  @override
  String toString() => "'$provider' should be implemented by the app";
}
