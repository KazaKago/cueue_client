import 'package:collection/collection.dart';
import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_infinite_mutate.dart';
import 'package:cueue/hooks/global/swr/swr_infinite_state.dart';
import 'package:cueue/hooks/global/swr/swr_lifecycle_observer.dart';
import 'package:cueue/hooks/global/swr/swr_mutate.dart';
import 'package:cueue/hooks/global/swr/swr_options.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';
import 'package:cueue/hooks/global/swr/swr_system_cache.dart';
import 'package:cueue/hooks/global/swr/swr_validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRInfiniteState<KEY, DATA> useSWRInfinite<KEY, DATA>(
  KEY? Function(int pageIndex, DATA? previousPageData) getKey,
  Future<DATA> Function(KEY key) fetcher,
) {
  final pageIndex = useState(1);
  var pageDataList = <ValueNotifier<DATA?>>[];
  var pageErrorList = <ValueNotifier<Exception?>>[];
  var pageIsValidating = <ValueNotifier<bool>>[];
  var pageStateList = <SWRState<KEY, DATA>>[];
  for (var index = 0; index < pageIndex.value; index++) {
    final key = getKey(index + 1, (0 < index) ? pageStateList[index - 1].data : null);
    final data = swrCache.data<KEY?, DATA>(key);
    final error = swrSystemCache.error(key);
    final isValidating = swrSystemCache.isValidating(key);
    pageDataList += [data];
    pageErrorList += [error];
    pageIsValidating += [isValidating];

    final validate = SWRValidate<KEY, DATA>(data, error, isValidating, fetcher);
    final mutate = SWRMutate<KEY, DATA>(key, data, error, validate);
    final state = SWRState(data: data.value, error: error.value, isValidating: isValidating.value, mutate: mutate);
    pageStateList += [state];

    if (index == 0) {
      revalidateOnReconnect(validate, key);
    }
  }
  useListenable(Listenable.merge(pageDataList));
  useListenable(Listenable.merge(pageErrorList));
  useListenable(Listenable.merge(pageIsValidating));

  _revalidateOnMount(pageStateList);
  _revalidateAllOnFocus(pageStateList);

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

void _revalidateOnMount<KEY, DATA>(List<SWRState<KEY, DATA>> pageStateList) {
  useEffect(
    () {
      Future.microtask(() {
        for (final state in pageStateList) {
          if (state.data == null && state.error == null && !state.isValidating) {
            state.mutate(null);
          }
        }
      });
      return null;
    },
    [pageStateList],
  );
}

void _revalidateAllOnFocus<KEY, DATA>(List<SWRState<KEY, DATA>> pageStateList) {
  useEffect(
    () {
      void callback(NavigatorEvent event) {
        switch (event) {
          case NavigatorEvent.resume:
            Future.microtask(() => SWRInfiniteMutate(pageStateList).call(null));
          case NavigatorEvent.pause:
            // do nothing.
            break;
        }
      }

      swrLifecycleObserver.addObserver(callback);
      return () => swrLifecycleObserver.removeObserver(callback);
    },
    const [],
  );
}
