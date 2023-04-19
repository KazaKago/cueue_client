import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString(BuildContext context) {
    final formatter = DateFormat(intl(context).dateFormat, Localizations.localeOf(context).toString());
    final formatted = formatter.format(toLocal());
    return formatted;
  }

  String toDateTimeString(BuildContext context) {
    final formatter = DateFormat(intl(context).dateTimeFormat, Localizations.localeOf(context).toString());
    final formatted = formatter.format(toLocal());
    return formatted;
  }
}
