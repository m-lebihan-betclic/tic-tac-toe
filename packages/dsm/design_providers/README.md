# design_providers

Riverpod contracts for the design-system primitives. Both throw until composition feeds them,
so a missing palette fails on first build rather than rendering a half-themed screen.

**Import:** `package:design_providers/design_providers.dart`

## Public API

`bindProviders({palette, typography})`, plus `appPaletteProvider` and `appTypographyProvider`
re-exported through the barrel for features that build their own theme extension.

## Gotchas

A feature reads these **only** inside its `providers_internal.br.dart`, to build its own
`ThemeExtension`. A widget that reads `appPaletteProvider` directly has skipped the feature
theme, and composition can no longer restyle it.
