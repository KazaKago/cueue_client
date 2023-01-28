import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

SWRTriggerState<bool, void> useEasyLoading() {
  return useSWRTrigger((value) => value ? EasyLoading.show() : EasyLoading.dismiss());
}
