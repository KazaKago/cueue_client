extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime date) {
    return difference(DateTime(date.year, date.month, date.day)).inDays == 0;
  }

  bool isToday() {
    return isSameDay(DateTime.now());
  }

  bool isTomorrow() {
    return isSameDay(DateTime.now().add(const Duration(days: 1)));
  }

  bool isDayAfterTomorrow() {
    return isSameDay(DateTime.now().add(const Duration(days: 2)));
  }
}
