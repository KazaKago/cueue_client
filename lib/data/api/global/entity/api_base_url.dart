import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiBaseUrl {
  const ApiBaseUrl();

  Uri get value => Uri.parse(dotenv.get('API_BASE_URL'));
}
