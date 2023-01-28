import 'package:flutter/foundation.dart';

class SWRValidate<KEY, DATA> {
  SWRValidate(this.data, this.error, this.isValidating, this.fetcher);

  final ValueNotifier<DATA?> data;
  final ValueNotifier<Exception?> error;
  final ValueNotifier<bool> isValidating;
  final Future<DATA> Function(KEY key) fetcher;

  Future<void> call(KEY? key) async {
    if (key == null) return;
    if (isValidating.value) return;

    isValidating.value = true;
    try {
      error.value = null;
      final newData = await fetcher(key);
      data.value = newData;
    } on Exception catch (e) {
      error.value = e;
    }
    isValidating.value = false;
  }
}
