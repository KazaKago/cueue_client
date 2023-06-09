import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:url_launcher/url_launcher.dart';

SWRTriggerState<void, bool> useGoTermsOfService() {
  const lpBaseUrl = String.fromEnvironment('lpBaseUrl');
  return useSWRTrigger<void, bool>((_) async {
    final uri = Uri.parse('$lpBaseUrl/terms_of_service.html');
    return launchUrl(uri);
  });
}
