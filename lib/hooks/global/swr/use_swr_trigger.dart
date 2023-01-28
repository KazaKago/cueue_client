import 'package:cueue/hooks/global/swr/swr_reset.dart';
import 'package:cueue/hooks/global/swr/swr_trigger.dart';
import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRTriggerState<ARG, DATA> useSWRTrigger<ARG, DATA>(
  Future<DATA> Function(ARG key) fetcher,
) {
  final data = useState<DATA?>(null);
  final error = useState<Exception?>(null);
  final isMutating = useState(false);
  final trigger = SWRTrigger<ARG, DATA>(data, error, isMutating, fetcher);
  final reset = SWRReset<ARG, DATA>(data, error, isMutating);

  return SWRTriggerState(data: data.value, error: error.value, isMutating: isMutating.value, trigger: trigger, reset: reset);
}
