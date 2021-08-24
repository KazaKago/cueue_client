class EmailValidationException implements Exception {
  const EmailValidationException(this.value);

  final String value;
}
