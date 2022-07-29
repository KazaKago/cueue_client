class RequireReauthenticationException implements Exception {
  const RequireReauthenticationException(this.type);

  final RequireReauthenticationType type;
}

abstract class RequireReauthenticationType {
  const RequireReauthenticationType();

  const factory RequireReauthenticationType.deleteAccount() = _DeleteAccount;

  R when<R>({
    required R Function() deleteAccount,
  }) {
    if (this is _DeleteAccount) {
      return deleteAccount();
    } else {
      throw TypeError();
    }
  }
}

class _DeleteAccount extends RequireReauthenticationType {
  const _DeleteAccount();
}
