class UserNotFoundException implements Exception {
  const UserNotFoundException(this.value);

  final String value;
}
