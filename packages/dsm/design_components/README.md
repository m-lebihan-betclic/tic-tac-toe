# design_components

The widgets used by more than one feature, with their states. Single-feature widgets stay in
their feature — a component earns its place here by having a second caller.

**Import:** `package:design_components/design_components.dart`

## Public API

`context.palette` and `context.typography`, plus one class per component. See the component
catalogue in the design handoff `README.md` for every component's states and geometry.

## Gotchas

- **No Riverpod in this package, and no Material widgets.** Components are plain `StatelessWidget`
  / `StatefulWidget` reading tokens off `ThemeData` extensions, which is what keeps a golden test
  to a single `pumpWidget`.
- **No ink, so no splash to suppress.** Every interactive surface uses one press treatment — the
  fill shifts over `AppMotion.press` (90ms), no ripple, no scale, no elevation. Reaching for
  `NoSplash.splashFactory` is the signal that something imported `InkWell`.
- **Every component here ships a golden**, covering all three themes and every state. That is the
  rule here, and it is cheap to honour when the component is this small.
