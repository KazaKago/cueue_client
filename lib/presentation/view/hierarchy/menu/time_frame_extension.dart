import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension TimeFrameExtension on TimeFrame {
  String toFormattedString(final BuildContext context) {
    switch (this) {
      case TimeFrame.breakfast:
        return AppLocalizations.of(context)!.breakfast;
      case TimeFrame.lunch:
        return AppLocalizations.of(context)!.lunch;
      case TimeFrame.snackTime:
        return AppLocalizations.of(context)!.snackTime;
      case TimeFrame.dinner:
        return AppLocalizations.of(context)!.dinner;
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
