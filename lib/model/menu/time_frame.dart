enum TimeFrame {
  breakfast,
  lunch,
  snackTime,
  dinner,
}

extension TimeFrameSorting on TimeFrame {
  int sortingValue() {
    switch (this) {
      case TimeFrame.breakfast:
        return 4;
      case TimeFrame.lunch:
        return 3;
      case TimeFrame.snackTime:
        return 2;
      case TimeFrame.dinner:
        return 1;
    }
  }
}
