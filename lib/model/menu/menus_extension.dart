import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/model/menu/time_frame.dart';

extension TimeFrameExtension on List<MenuSummary> {
  void timedSort() {
    sort((value1, value2) {
      final dateCompare = value2.date.compareTo(value1.date);
      if (dateCompare != 0) return dateCompare;
      final timeFrameCompare = value1.timeFrame.sortingValue() - value2.timeFrame.sortingValue();
      if (timeFrameCompare != 0) return timeFrameCompare;
      return value2.id.value - value1.id.value;
    });
  }
}
