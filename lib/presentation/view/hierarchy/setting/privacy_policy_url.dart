import 'package:flutter_dotenv/flutter_dotenv.dart';

class PrivacyPolicyUrl {
  const PrivacyPolicyUrl();

  Uri get value => Uri.parse('${dotenv.get('LP_BASE_URL')}/privacy_policy.html');
}
