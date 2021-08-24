import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString(final BuildContext context) {
    final formatter = DateFormat(AppLocalizations.of(context)!.dateFormat, Localizations.localeOf(context).toString());
    final formatted = formatter.format(this);
    return formatted;
  }

  String toDateTimeString(final BuildContext context) {
    final formatter = DateFormat(AppLocalizations.of(context)!.dateTimeFormat, Localizations.localeOf(context).toString());
    final formatted = formatter.format(this);
    return formatted;
  }
}
