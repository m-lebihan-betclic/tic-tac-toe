export 'src/providers.dart';
// Unlike a feature, a DSM package's contract *is* its public API: features read the palette
// and the type scale to build their own theme extension. Composition still feeds it, and only
// through `bindProviders`.
export 'src/providers_di.br.dart';
