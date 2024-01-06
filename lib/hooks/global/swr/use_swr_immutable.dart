import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';

SWRState<KEY, DATA> useSWRImmutable<KEY, DATA>(
  KEY? key,
  Future<DATA> Function(KEY key) fetcher, {
  DATA? fallbackData,
}) {
  return useSWR(
    key,
    fetcher,
    fallbackData: fallbackData,
    revalidateOnMount: false,
    revalidateOnFocus: false,
    revalidateOnReconnect: false,
  );
}
