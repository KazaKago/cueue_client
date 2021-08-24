import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppleClientId {
  const AppleClientId();

  String get value => dotenv.get('APPLE_CLIENT_ID');
}
