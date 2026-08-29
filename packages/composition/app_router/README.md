# app_router

The `AppRouter` (auto_route) plus one `App{Feature}Routing` class per feature routing port.

**Import:** `package:app_router/app_router.dart`

## Public API

`appRouterProvider`, `AppRouter`, `RoutePath`, and the routing implementations composition
hands to each feature's `bindProviders(routing: …)`.

## Gotchas

This and `app_providers` are the only packages allowed to depend on more than one feature.
A feature route is registered here, but its *path segment* stays in the feature's own
`{Feature}RoutePath` enum — never hardcode a string in this file.
