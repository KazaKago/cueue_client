import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:cueue/hooks/hierarchy/setting/use_get_app_info.dart';
import 'package:url_launcher/url_launcher.dart';

SWRTriggerState<void, bool> useGoStore() {
  final state = useGetAppInfo();
  return useSWRTrigger<void, bool>((_) async {
    final appInfo = state.data;
    if (appInfo == null) return false;
    return launchUrl(appInfo.storeLink);
  });
}
