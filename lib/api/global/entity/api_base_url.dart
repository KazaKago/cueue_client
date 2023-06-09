class ApiBaseUrl {
  const ApiBaseUrl();

  Uri get value => Uri.parse(const String.fromEnvironment('apiBaseUrl'));
}
