import 'package:cueue/legacy/presentation/view/global/l10n/intl.dart';
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
  return DateFormat(newPattern ?? intl(context).dateFormat, locale?.toString() ?? Localizations.localeOf(context).toString());
}

DateFormat useDateTimeFormat({String? newPattern, Locale? locale}) {
  final context = useContext();
  return DateFormat(newPattern ?? intl(context).dateTimeFormat, locale?.toString() ?? Localizations.localeOf(context).toString());
}
