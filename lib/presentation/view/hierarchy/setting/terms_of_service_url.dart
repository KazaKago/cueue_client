import 'package:flutter_dotenv/flutter_dotenv.dart';

class TermsOfServiceUrl {
  const TermsOfServiceUrl();

  Uri get value => Uri.parse('${dotenv.get('LP_BASE_URL')}/terms_of_service.html');
}
