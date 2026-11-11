import 'package:flutter/widgets.dart';
import 'package:j_donuts_app/l10n/gen/app_localizations.dart';

export 'package:j_donuts_app/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
