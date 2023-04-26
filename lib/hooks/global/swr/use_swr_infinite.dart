import 'package:collection/collection.dart';
import 'package:cueue/hooks/global/swr/swr_infinite_mutate.dart';
import 'package:cueue/hooks/global/swr/swr_infinite_state.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/use_swr.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRInfiniteState<KEY, DATA> useSWRInfinite<KEY, DATA>(
  KEY? Function(int pageIndex, DATA? previousPageData) getKey,
  Future<DATA> Function(KEY key) fetcher,
) {
  final pageIndex = useState(1);
  final pageKeyList = <KEY?>[];
  final pageStateList = <SWRState<KEY, DATA>>[];
  for (var index = 0; index < pageIndex.value; index++) {
    pageKeyList.add(getKey(index + 1, (index < pageStateList.length) ? pageStateList[index - 1].data : null));
    pageStateList.add(useSWR(pageKeyList[index], fetcher));
  }

  final isDataAvailable = pageStateList.any((element) => element.data != null);
  return SWRInfiniteState<KEY, DATA>(
    data: isDataAvailable ? pageStateList.map((element) => element.data).toList() : null,
    error: pageStateList.firstWhereOrNull((element) => element.error != null)?.error,
    isValidating: pageStateList.any((element) => element.isValidating),
    mutate: SWRInfiniteMutate(pageStateList),
    size: pageIndex.value,
    setSize: (size) => pageIndex.value = size,
  );
}
