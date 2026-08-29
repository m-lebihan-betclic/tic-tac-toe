# Tic-Tac-Toe

Local play, human against a CPU opponent. Flutter, iOS and Android.

Built to a production monorepo architecture: a Dart pub workspace of small packages,
Clean Architecture three layers deep, Riverpod 3 with code generation, and composition-root
dependency injection.

## Run it

```bash
mise install        # Flutter 3.44.4
mise run bs         # dart pub get + melos bootstrap
mise run generate   # riverpod, freezed, auto_route, theme_tailor
cd apps/tic_tac_toe && flutter run
```

## Check it

```bash
mise run analyze    # target: "No issues found!"
mise run test
mise run goldens
```

## Documentation

- [`CONVENTIONS.md`](CONVENTIONS.md) — the architecture in one page: layers, the provider
  triple, error handling, routing ports, naming, test conventions.
