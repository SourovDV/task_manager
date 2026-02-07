import 'package:flutter/material.dart';
import 'package:task_manager/l10n/app_localizations.dart';


extension LocalizationExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
