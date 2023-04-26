import 'package:collection/collection.dart';
import 'package:cueue/hooks/global/swr/swr_state.dart';

class SWRInfiniteMutate<KEY, DATA> {
  SWRInfiniteMutate(this.pageStateList);

  List<SWRState<KEY, DATA>> pageStateList;

  Future<void> call(
    Future<List<DATA>?> Function()? data, {
    List<DATA>? optimisticData,
    bool revalidate = true,
  }) async {
    final dataList = await data?.call();
    pageStateList.mapIndexed((index, swrState) {
      swrState.mutate.call(
        (dataList != null && index < dataList.length) ? () async => dataList[index] : null,
        optimisticData: (optimisticData != null && index < optimisticData.length) ? optimisticData[index] : null,
        revalidate: revalidate,
      );
    });
  }
}
