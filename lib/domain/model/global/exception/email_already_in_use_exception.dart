class EmailAlreadyInUseException implements Exception {
  const EmailAlreadyInUseException(this.value);

  final String value;
}
