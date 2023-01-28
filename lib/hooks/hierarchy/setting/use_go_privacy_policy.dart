import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/global/utils/use_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

SWRTriggerState<void, bool> useGoPrivacyPolicy() {
  final lpBaseUrl = useDotEnv('LP_BASE_URL');
  return useSWRTrigger<void, bool>((_) {
    final uri = Uri.parse('$lpBaseUrl/privacy_policy.html');
    return launchUrl(uri);
  });
}
