class DoNotMatchPasswordException implements Exception {
  const DoNotMatchPasswordException(this.value);

  final String value;
}
