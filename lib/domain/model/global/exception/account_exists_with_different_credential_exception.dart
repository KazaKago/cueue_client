class AccountExistsWithDifferentCredentialException implements Exception {
  const AccountExistsWithDifferentCredentialException(this.existsSignInMethods);

  final List<String> existsSignInMethods;
}
