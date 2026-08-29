# l10n

Every user-facing string, in English and French. Its own package so features can depend on the
copy without depending on the app.

**Import:** `package:l10n/l10n.dart`

## Public API

`AppLocalizations`, `context.l10n`, and the delegates re-exported from `flutter_localizations`.

## Gotchas

Edit the ARB files in `lib/src/l10n/`, then run `mise run l10n` — never hand-edit
`lib/src/generated/`. `app_en.arb` is the template: a key missing there is not generated at
all, and a key missing from `app_fr.arb` silently falls back to English.
