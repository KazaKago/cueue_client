import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';

class RequireReauthenticationException implements Exception {
  const RequireReauthenticationException(this.type);

  final RequireReauthenticationType type;
}

abstract class RequireReauthenticationType {
  const RequireReauthenticationType();

  const factory RequireReauthenticationType.settingEmail(Email email) = _SettingEmail;

  const factory RequireReauthenticationType.settingPassword(Password password) = _SettingPassword;

  const factory RequireReauthenticationType.deleteAccount() = _DeleteAccount;

  R when<R>({
    required R Function(Email email) settingEmail,
    required R Function(Password password) settingPassword,
    required R Function() deleteAccount,
  }) {
    if (this is _SettingEmail) {
      return settingEmail((this as _SettingEmail).email);
    } else if (this is _SettingPassword) {
      return settingPassword((this as _SettingPassword).password);
    } else if (this is _DeleteAccount) {
      return deleteAccount();
    } else {
      throw TypeError();
    }
  }
}

class _SettingEmail extends RequireReauthenticationType {
  const _SettingEmail(this.email);

  final Email email;
}

class _SettingPassword extends RequireReauthenticationType {
  const _SettingPassword(this.password);

  final Password password;
}

class _DeleteAccount extends RequireReauthenticationType {
  const _DeleteAccount();
}
