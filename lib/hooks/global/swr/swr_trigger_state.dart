import 'package:cueue/hooks/global/swr/swr_reset.dart';
import 'package:cueue/hooks/global/swr/swr_trigger.dart';

class SWRTriggerState<ARG, DATA> {
  SWRTriggerState({required this.data, required this.error, required this.isMutating, required this.trigger, required this.reset});

  DATA? data;
  Exception? error;
  bool isMutating;
  SWRTrigger<ARG, DATA> trigger;
  SWRReset<ARG, DATA> reset;
}
