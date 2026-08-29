import 'package:flutter/widgets.dart';
import 'package:l10n/src/generated/app_localizations.dart';

extension BuildContextL10n on BuildContext {
  /// The localised strings for the active locale.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
