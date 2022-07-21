import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:universal_html/html.dart';

class AppleRedirectUri {
  const AppleRedirectUri();

  Uri get value => Uri.parse(kIsWeb ? 'https://${window.location.host}' : dotenv.get('APPLE_REDIRECT_URI'));
}
