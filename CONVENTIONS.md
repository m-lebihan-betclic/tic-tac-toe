# Conventions, in one page

## Layers

```
domain        entities, contracts (repositories), behaviors.  Depends on NOTHING.
data          implements the domain's contracts.  Depends on its domain, nothing else.
presentation  screen, widgets, theme, routing port.  Depends on its domain, NEVER on data.
composition   app_providers, app_router.  The ONLY layer that knows every feature,
              and the only one that calls bindProviders().
```

Every box is its own package with its own `pubspec.yaml`, so the layering is enforced by the
dependency graph, not by folder discipline.

**A feature never imports another feature.** What is shared goes through `shared_domain`, or
through injection.

### The rules are private; the results are shared

`shared_domain/session/domain` holds the *vocabulary* other features read — `Player`,
`AppTheme`, `AppLocale`, `Difficulty`, `GameOutcome`, `WinningLine`, `Round`, `Scores`, and the
three repository contracts.

The *rules* of tic-tac-toe stay in `features/game/domain`, where nothing else can reach them:
the board, the turn order, what a legal move is, what counts as a win, and the CPU. History
renders `Won · left column`, so it needs `WinningLine`; it has no business knowing what a
`Board` is.

`shared_domain/*` is **domain only** — never a data layer. In-memory implementations of the
shared contracts live in the feature data packages that own them.

## The provider triple

Every package that exposes providers has the same three files:

| File | Role |
|---|---|
| `providers_di.br.dart` | **incoming contracts**: each provider throws `UnregisteredProviderException`. **Never exported from the barrel.** |
| `providers_internal.br.dart` | internal wiring and in-package defaults (the default feature theme lives here). Not public. |
| `providers.br.dart` / `providers.dart` | the public API plus `bindProviders({...})`, returning `List<Override>` |

Composition only ever calls `bindProviders(...)`. It never overrides a `providers_di` symbol
directly.

**An unfed contract fails on first build** — never a silent `null`.

One public providers file per package. If the layer exposes a public `@riverpod` provider it
needs codegen, so it is `providers.br.dart` and there is no `providers.dart`; otherwise it is
plain `providers.dart`.

## Errors are values

```dart
Result<Game, MoveError> play(Game game, int slot);   //  Success | Failure
```

- **Exceptions are for programming errors** (`UnregisteredProviderException`), nothing else.
- A rejected move is a `Failure`, visible in the signature and impossible for a caller to ignore
  silently: the compiler refuses to unwrap a `Result` without handling both sides.
- On the state side, `getOrThrow()` moves the failure into an `AsyncValue` so a screen reads an
  `AsyncError` without ever touching a `Result`.
- A screen renders **user-facing copy from l10n**. Never `Text('$error')`.

## Navigation: the feature emits, composition decides

A feature declares a **port** and names its methods after events:

| Kind | Shape | Example |
|---|---|---|
| Intent | `on…Requested` | `onSettingsRequested` |
| Outcome | `on…Successful` | `onSetupCompleted` |
| Dismiss | `onDismiss…` | `onDismissSettings` |

Avoid `navigateTo…` / `push…` (the destination belongs to the router) and `onTap…` /
`on…Clicked` (describe the intent, not the gesture).

Paths are colocated `{Feature}RoutePath` enums — never a hardcoded string, never one central
enum.

## Riverpod

- `@riverpod` plus codegen. **The generator strips the `Notifier` suffix**: `class
  GameUiStateNotifier` → `gameUiStateProvider`.
- `ref.watch(xProvider.select((x) => x.field))` to avoid rebuilds.
- **Presentation never reads a repository.** It watches state providers and calls **behaviors**.
- In tests, override only **direct** dependencies, through the public `bindProviders`.

## Style

- Any file needing codegen ends in **`.br.dart`**, with the matching `part` (`.br.g.dart`,
  `.br.freezed.dart`, `.br.tailor.dart`, `.br.gr.dart`). Every `build.yaml` restricts its
  generators to `**/*.br.dart`, so build_runner never scans a file with nothing to generate.
- Member order: **fields, then constructors, then methods**.
- **Alphabetical order** everywhere: parameters, fields, enum constants, imports, dependencies.
- 120 columns. Never `!` (force-unwrap). Never `print()` / `debugPrint()`.
- Never `DateTime.now()` in testable logic, never a bare `Random()`, and never a hardcoded
  `Duration` a test would have to wait out — inject all three. The CPU's 700ms thinking beat is
  a constructor parameter for exactly this reason: a test passes `Duration.zero`.
- **Never a raw colour** (`0xFF…`, `Colors.red`) or a hardcoded dimension in a feature: read the
  **feature theme** (`{feature}ThemeProvider`), which is built from the design-system tokens in
  `providers_internal.br.dart`. A feature never imports `design_tokens`' palette directly.
- **A screen is a `Scaffold`, its `backgroundColor` read from the feature theme.** There is
  deliberately no `ThemeData.scaffoldBackgroundColor` to fall back on: it would bypass the seam
  composition overrides. The `Scaffold` is also what puts a `Material` in the tree — without one
  every `Text` inherits `MaterialApp`'s fallback style, monospace with a yellow double underline.
- User-facing copy lives in the `l10n` package. No string literals in widgets.

## Performance

Rebuild cost and resource cleanup are reviewed, so they are conventions rather than
afterthoughts.

- **`const` wherever the analyzer allows it.** A `const` widget is skipped entirely on rebuild.
- **`ref.watch(p.select((s) => s.field))`**, never a whole-object watch for one field. Watching
  `GameUiState` to read `scores` rebuilds the board on every move.
- **A widget class, not a function returning `Widget`.** Only a class gets a `const` call site,
  its own element, its own provider subscription and therefore its own rebuild boundary. A
  function returning a `Widget` rebuilds with its parent, always.
- **`RepaintBoundary`** around anything that repaints independently of its neighbours — the win
  line while it draws, the CRT overlay, a blinking dot. Without it the whole subtree repaints at
  the animation's frame rate.
- **`.builder` constructors** for any list that can grow. The session round list qualifies.
- **Stable keys** on widgets in a list whose order or length changes, or Flutter reuses the wrong
  element and state lands on the wrong row.
- **Dispose everything that outlives a frame**: timers, animation controllers, subscriptions,
  focus nodes. In a notifier that is `ref.onDispose`; in a `State` it is `dispose()`. The CPU's
  pending move is a timer, and `Reset game` is enabled while it runs — so it must be cancelled on
  reset *and* on dispose.
- **`keepAlive` only where state must outlive its last listener** — the in-memory session store
  does; a screen's UI state does not. Both mistakes are bugs: the first loses the nickname on
  navigation, the second leaks.

## Layout

**Components take the available space; the gaps between them are fixed.** The HTML spec declares
the board as `grid-template-columns: repeat(3, 1fr); gap: 1px` — columns that *fill*, with a fixed
gap. Every pinned pixel in that file (`width:390px`, `height:114px`) is what `1fr` resolved to at
the reference viewport, not a size to reproduce.

- **Gaps are fixed `AppSpacing` tokens, children are `Expanded`.** `Row` and `Column` take a
  `spacing:` parameter — use it. Never express a gap as a fraction of the parent.
- **N equal columns is `List.generate(n, (_) => Expanded(…))`**, never a width divided by N. The
  board is an `AspectRatio(1)` of three `Expanded` rows of three `Expanded` cells, its hairlines
  `spacing: AppSizing.hairline` letting the board's own background show through.
- **A size that is a consequence of the layout gets no token.** Widths are essentially never
  fixed. Fixed sizes are chrome only — control heights, icon and glyph sizes, `hairline`,
  `minHitTarget`. A button is `SizedBox(height: AppSizing.buttonHeight)` with **no width**: it
  hugs its parent.
- **Shape geometry is a ratio of the box it is painted into, and lives beside the painter** — a
  private `const` in that widget's file, written `numerator / reference` so the drawn number stays
  readable. The whole glyph scales, **stroke included**. Only chrome strokes (`hairline`, borders)
  stay absolute.
- **Safe area is the screen's job, never the design system's.** `design_tokens` ships a scale and
  knows nothing about insets — no token is named for one. A screen applies `SafeArea`, or reads
  `MediaQuery.paddingOf(context)` and adds a scale value on top: the design's air below the last
  element is `MediaQuery.paddingOf(context).bottom + AppSpacing.spacing800`. Use
  `MediaQuery.sizeOf` / `paddingOf`, never `MediaQuery.of(context).size`.
- **No breakpoints and no device classes.** One phone-portrait form factor; where a screen truly
  needs a measurement, `LayoutBuilder`.
- **Text scales, and a height wrapped around text scales with it.** Font sizes are fixed tokens,
  but the reader's Dynamic Type setting multiplies them. Any block the design pins to a fixed
  height around text — the status block's two lines — is
  `MediaQuery.textScalerOf(context).scale(height)`, never a constant, or large text clips.
- **Every screen golden runs at two widths: `390×780` and `320×780`.** This is what makes the
  rules above enforceable rather than aspirational: a constraint-driven screen passes both, and
  the moment someone pins a width the 320 baseline overflows and the build fails. Two widths
  proving responsiveness is worth more than a third theme at one width.

## Behaviors

Business logic in the domain layer is a **behavior**:

- Named for a **verb**, PascalCase, **no `Behavior` suffix** — `PlayMove`, not `PlayMoveBehavior`.
  File is the same verb in snake_case under `domain/lib/src/behaviors/`.
- One `call` method (a callable object), `const`, dependencies injected through the constructor.
- **Pure**: plain data in, plain data out. Never a `Ref`, `WidgetRef`, `BuildContext` or provider.
- **Never exported and never exposed as an instance.** The barrel does not export
  `behaviors/`. A provider exposes the *result* of calling it, or the bare `call` as a callable.

## Tests

`test/unit/src/` mirrors `lib/src/`, using **givn** and **shouldly**:

```dart
given('an empty board', (context) => …)
  .when('the player takes the centre square', (sut, _) => sut(game, 4))
  .then('the mark is placed and it becomes the CPU\'s turn', (result, _) => …);
```

- Sentences describe **user behaviour**, not implementation. "the player takes a taken square"
  yes; "playMove is called with 4" no.
- Mocks are generated by mockito from `test/unit/src/<package>_mocks.dart`
  (`@GenerateMocks([...])`, never `@GenerateNiceMocks`), read via `context.mockOf<Mock…>()`.
- Freezed and data classes are **not mocked** — use real instances and `copyWith`.
- Assert the whole object with one equality rather than field by field, and keep the scenario's
  input data inline so inputs → outputs are visible.
- **No `await Future.delayed` in a test.** A test that sleeps is a test that is slow, flaky and
  lying about what it verifies: it asserts that time passed, not that behaviour is correct. Where
  a delay is real — the CPU beat, an animation — inject the duration and pass zero, or drive the
  clock with `fakeAsync`. The same goes for `pumpAndSettle` standing in for a missing await.
- Cover the edges, not just the happy path: empty, full, already-finished, out-of-turn. Those are
  the four that matter here and they are all cheap.

### Goldens

Verified working end to end — `goldens-update` writes baselines, `goldens` verifies, and an 8px
change fails all three themes.

- **Wrap the subject in a keyed `RepaintBoundary` and match `find.byKey`.** Without it the capture
  is the whole 800×600 surface instead of the component, and `find.byType(RepaintBoundary)` throws
  "matched too many widgets" — `MaterialApp` and `Scaffold` each add their own.
- Install `AppPalette` + `AppTypography` in `ThemeData.extensions` and loop
  `light() / dark() / matrix()` so one file covers three themes.
- `await tester.pumpAndSettle()` before every capture, or an in-flight animation flakes the test.
- Text renders as boxes. Goldens verify layout, colour and assets — never glyphs.
- Baselines are macOS-local (they drift on Linux); commit them, and say so in the repo README.

## Commands

```bash
mise run bs         # after any pubspec change (or after Mason)
mise run generate   # after touching a .br.dart
mise run format
mise run analyze    # target: "No issues found!"
mise run test
mise run goldens
```

**The reflex:** does `analyze` mention `_$…`, `.g.dart`, `.freezed.dart`, `.tailor.dart` or
`.gr.dart`? Re-run build_runner **in that package**.
