import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_mutate.dart';
import 'package:cueue/hooks/global/swr/swr_options.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_validate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRState<KEY, DATA> useSWR<KEY, DATA>(
  KEY? key,
  Future<DATA> Function(KEY key) fetcher, {
  bool revalidateOnMount = true,
  bool revalidateOnFocus = true,
  bool revalidateOnReconnect = true,
  DATA? fallbackData,
}) {
  final data = useListenable(swrCache.data<KEY?, DATA>(key));
  final error = useListenable(swrSystemCache.error(key));
  final isValidating = useListenable(swrSystemCache.isValidating(key));
  final validate = SWRValidate<KEY, DATA>(data, error, isValidating, fetcher);
  final mutate = SWRMutate<KEY, DATA>(key, data, error, validate);

  revalidateOnMountOption(validate, key, isEnabled: revalidateOnMount, fallbackData: fallbackData);
  revalidateOnFocusOption(validate, key, isEnabled: revalidateOnFocus);
  revalidateOnReconnectOption(validate, key, isEnabled: revalidateOnReconnect);

  return SWRState(data: data.value ?? fallbackData, error: error.value, isValidating: isValidating.value, mutate: mutate);
}
