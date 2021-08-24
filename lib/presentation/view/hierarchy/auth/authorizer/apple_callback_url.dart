import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppleCallbackUrl {
  const AppleCallbackUrl();

  Uri get value => Uri.parse(dotenv.get('APPLE_CALLBACK_URL'));
}
