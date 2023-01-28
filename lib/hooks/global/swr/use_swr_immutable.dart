import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_mutate.dart';
import 'package:cueue/hooks/global/swr/swr_options.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_validate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRState<KEY, DATA> useSWRImmutable<KEY, DATA>(
  KEY? key,
  Future<DATA> Function(KEY key) fetcher,
) {
  final data = useListenable(swrCache.data<KEY?, DATA>(key));
  final error = useListenable(swrSystemCache.error(key));
  final isValidating = useListenable(swrSystemCache.isValidating(key));
  final validate = SWRValidate<KEY, DATA>(data, error, isValidating, fetcher);
  final mutate = SWRMutate<KEY, DATA>(key, data, error, validate);

  revalidateOnMount(validate, key);

  return SWRState(data: data.value, error: error.value, isValidating: isValidating.value, mutate: mutate);
}
