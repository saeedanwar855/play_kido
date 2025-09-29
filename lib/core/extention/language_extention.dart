import 'package:flutter/material.dart';
import 'package:play_kido/l10n/arb/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}
