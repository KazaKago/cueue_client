import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/l10n/intl.dart';
import 'package:flutter/widgets.dart';

extension TimeFrameExtension on TimeFrame {
  String toFormattedString(BuildContext context) {
    switch (this) {
      case TimeFrame.breakfast:
        return intl(context).breakfast;
      case TimeFrame.lunch:
        return intl(context).lunch;
      case TimeFrame.snackTime:
        return intl(context).snackTime;
      case TimeFrame.dinner:
        return intl(context).dinner;
    }
  }

  Image toFormattedImage() {
    switch (this) {
      case TimeFrame.breakfast:
        return Assets.images.time1Asa.image();
      case TimeFrame.lunch:
        return Assets.images.time2Hiru.image();
      case TimeFrame.snackTime:
        return Assets.images.time3Yuu.image();
      case TimeFrame.dinner:
        return Assets.images.time4Yoru.image();
    }
  }
}
