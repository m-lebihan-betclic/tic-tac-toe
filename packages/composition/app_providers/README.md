# app_providers

The composition root. Every `bindProviders()` call in the app lives in one list here.

**Import:** `package:app_providers/app_providers.dart`

## Public API

`appProviders()` → `List<Override>`, passed straight to the app's `ProviderScope`.

## Gotchas

Order matters only where one override feeds another. Never override a symbol from a feature's
`providers_di.br.dart` directly — call the feature's `bindProviders()`; that indirection is
what lets a feature change its contracts without composition knowing.
