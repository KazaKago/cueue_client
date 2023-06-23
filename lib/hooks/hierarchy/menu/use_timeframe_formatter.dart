import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/ui/global/utils/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

String Function(TimeFrame) useToFormattedString() {
  final context = useContext();
  return (timeFrame) {
    switch (timeFrame) {
      case TimeFrame.breakfast:
        return intl(context).breakfast;
      case TimeFrame.lunch:
        return intl(context).lunch;
      case TimeFrame.snackTime:
        return intl(context).snackTime;
      case TimeFrame.dinner:
        return intl(context).dinner;
    }
  };
}

Image Function(TimeFrame) useToFormattedImage() {
  return (timeFrame) {
    switch (timeFrame) {
      case TimeFrame.breakfast:
        return Assets.images.time1Asa.image();
      case TimeFrame.lunch:
        return Assets.images.time2Hiru.image();
      case TimeFrame.snackTime:
        return Assets.images.time3Yuu.image();
      case TimeFrame.dinner:
        return Assets.images.time4Yoru.image();
    }
  };
}
