import 'package:flutter/foundation.dart';

class SWRReset<ARG, DATA> {
  SWRReset(this.data, this.error, this.isMutating);

  final ValueNotifier<DATA?> data;
  final ValueNotifier<Exception?> error;
  final ValueNotifier<bool> isMutating;

  void call() {
    data.value = null;
    error.value = null;
    isMutating.value = false;
  }
}
