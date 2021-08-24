class WrongPasswordException implements Exception {
  const WrongPasswordException(this.value);

  final String value;
}
