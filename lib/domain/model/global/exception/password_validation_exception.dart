class PasswordValidationException implements Exception {
  const PasswordValidationException(this.value);

  final String value;
}
