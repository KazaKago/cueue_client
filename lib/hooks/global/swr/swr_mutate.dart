import 'package:cueue/hooks/global/swr/swr_validate.dart';
import 'package:flutter/foundation.dart';

class SWRMutate<KEY, DATA> {
  SWRMutate(this.key, this.data, this.error, this.validate);

  KEY? key;
  ValueNotifier<DATA?> data;
  ValueNotifier<Exception?> error;
  SWRValidate<KEY, DATA> validate;

  Future<void> call(
    Future<DATA?> Function()? data, {
    DATA? optimisticData,
    bool revalidate = true,
  }) async {
    final oldData = this.data.value;
    if (optimisticData != null) {
      this.data.value = optimisticData;
    }
    try {
      error.value = null;
      if (data != null) {
        final newData = await data();
        this.data.value = newData;
      }
      if (revalidate) {
        await validate(key);
      }
    } on Exception catch (error) {
      this.data.value = oldData;
      this.error.value = error;
    }
  }
}
