import 'package:cueue/model/menu/time_frame.dart';

class TimeFrameRequestMapper {
  const TimeFrameRequestMapper();

  String call(TimeFrame timeFrame) {
    switch (timeFrame) {
      case TimeFrame.breakfast:
        return 'breakfast';
      case TimeFrame.lunch:
        return 'lunch';
      case TimeFrame.snackTime:
        return 'snack_time';
      case TimeFrame.dinner:
        return 'dinner';
    }
  }
}
