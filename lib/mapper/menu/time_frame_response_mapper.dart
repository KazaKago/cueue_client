import 'package:cueue/model/menu/time_frame.dart';

class TimeFrameResponseMapper {
  const TimeFrameResponseMapper();

  TimeFrame call(String response) {
    switch (response) {
      case 'breakfast':
        return TimeFrame.breakfast;
      case 'lunch':
        return TimeFrame.lunch;
      case 'snack_time':
        return TimeFrame.snackTime;
      case 'dinner':
        return TimeFrame.dinner;
      default:
        throw StateError('Illegal state.');
    }
  }
}
