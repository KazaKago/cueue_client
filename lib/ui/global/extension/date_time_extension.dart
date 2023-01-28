import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

String Function(DateTime) useToDateString() {
  final context = useContext();
  return (dateTime) => dateTime.toDateString(context);
}

String Function(DateTime) useToDateTimeString() {
  final context = useContext();
  return (dateTime) => dateTime.toDateTimeString(context);
}

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
