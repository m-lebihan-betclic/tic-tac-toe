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

## The shape of it

```
apps/tic_tac_toe/

packages/
├── composition/
│   ├── app_providers/
│   └── app_router/
│
├── features/
│   ├── game/
│   │   ├── domain/
│   │   │   ├── lib/src/entities/
│   │   │   ├── lib/src/behaviors/
│   │   │   └── test/unit/src/
│   │   └── presentation/
│   │       ├── lib/src/notifiers/
│   │       ├── lib/src/state/
│   │       ├── lib/src/theme/
│   │       ├── lib/src/routing/
│   │       ├── lib/src/widgets/
│   │       └── test/
│   │           ├── unit/src/
│   │           └── golden/
│   │
│   ├── setup/presentation/
│   ├── settings/presentation/
│   ├── splash/presentation/
│   └── session/data/                 no presentation: the store the features share
│       ├── lib/src/data_sources/
│       └── lib/src/repositories/
│
├── shared_domain/session/domain/     domain-only, always
│   ├── lib/src/entities/
│   ├── lib/src/behaviors/
│   └── lib/src/repositories/
│
├── dsm/
│   ├── design_tokens/
│   ├── design_components/
│   │   └── test/golden/
│   ├── design_providers/
│   └── l10n/
│
└── utilities/
```

Dependencies point one way only: `presentation → domain ← data`, and nothing but `composition`
imports two features.

**The golden baselines are macOS-local.** Font rasterisation differs between platforms, so a
Linux run reports diffs on every one of them; there is no CI pipeline here and these do not
pretend otherwise. Regenerate with `mise run goldens-update`, and look at every changed PNG
before committing it — a golden you accept without opening is a baseline that pins a bug.

Two things to know when reading them. Text renders as filled boxes: goldens verify layout,
colour and assets, never glyphs. And the test font draws every character one em wide, so text
is far wider on these captures than on a device — which is a feature, not a nuisance. It is the
same pressure a long translation or a large Dynamic Type setting puts on a layout, and it is
what the 320 captures exist to apply.

## Documentation

- [`CONVENTIONS.md`](CONVENTIONS.md) — the architecture in one page: layers, the provider
  triple, error handling, routing ports, naming, test conventions.
