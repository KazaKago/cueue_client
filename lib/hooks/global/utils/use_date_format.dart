import 'package:cueue/ui/global/l10n/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

String Function(DateTime) useToDateString() {
  final formatter = useDateFormat();
  return formatter.format;
}

String Function(DateTime) useToDateTimeString() {
  final formatter = useDateTimeFormat();
  return formatter.format;
}

DateFormat useDateFormat({String? newPattern, Locale? locale}) {
  final context = useContext();
  final intl = useIntl();
  return DateFormat(newPattern ?? intl.dateFormat, locale?.toString() ?? Localizations.localeOf(context).toString());
}

DateFormat useDateTimeFormat({String? newPattern, Locale? locale}) {
  final context = useContext();
  final intl = useIntl();
  return DateFormat(newPattern ?? intl.dateTimeFormat, locale?.toString() ?? Localizations.localeOf(context).toString());
}
