import 'package:cueue/presentation/viewmodel/hierarchy/setting/settings_result.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension SettingsResultExtension on SettingResult {
  String toFormattedString(final BuildContext context) {
    switch (this) {
      case SettingResult.updatedEmail:
        return AppLocalizations.of(context)!.updatedMailAddress;
      case SettingResult.updatedPassword:
        return AppLocalizations.of(context)!.updatedPassword;
      case SettingResult.linkedWithGoogle:
        return AppLocalizations.of(context)!.linkedWithGoogle;
      case SettingResult.linkedWithApple:
        return AppLocalizations.of(context)!.linkedWithApple;
      case SettingResult.unlinkedWithGoogle:
        return AppLocalizations.of(context)!.unlinkedWithGoogle;
      case SettingResult.unlinkedWithApple:
        return AppLocalizations.of(context)!.unlinkedWithApple;
      case SettingResult.sentEmailVerification:
        return AppLocalizations.of(context)!.sentEmailVerification;
    }
  }
}
