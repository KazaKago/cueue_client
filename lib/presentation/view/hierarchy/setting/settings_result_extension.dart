import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/settings_result.dart';
import 'package:flutter/widgets.dart';

extension SettingsResultExtension on SettingResult {
  String toFormattedString(BuildContext context) {
    switch (this) {
      case SettingResult.linkedWithGoogle:
        return intl(context).linkedWithGoogle;
      case SettingResult.linkedWithApple:
        return intl(context).linkedWithApple;
      case SettingResult.unlinkedWithGoogle:
        return intl(context).unlinkedWithGoogle;
      case SettingResult.unlinkedWithApple:
        return intl(context).unlinkedWithApple;
      case SettingResult.sentEmailVerification:
        return intl(context).sentEmailVerification;
    }
  }
}
