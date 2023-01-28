import 'package:flutter/foundation.dart';

class SWRTrigger<ARG, DATA> {
  SWRTrigger(this.data, this.error, this.isMutating, this.fetcher);

  final ValueNotifier<DATA?> data;
  final ValueNotifier<Exception?> error;
  final ValueNotifier<bool> isMutating;
  final Future<DATA> Function(ARG arg) fetcher;

  Future<DATA?> call(ARG arg) async {
    isMutating.value = true;
    try {
      final newData = await fetcher(arg);
      data.value = newData;
      error.value = null;
      isMutating.value = false;
    } on Exception catch (e) {
      error.value = e;
      isMutating.value = false;
    }
    return data.value;
  }
}
