import 'package:flutter/foundation.dart';

final swrCache = SWRCache();

class SWRCache {
  final Map<dynamic, ValueNotifier<dynamic>> _dataStateMap = {};

  ValueNotifier<DATA?> data<KEY, DATA>(KEY key) {
    return _dataStateMap.putIfAbsent(key, () => ValueNotifier<DATA?>(null)) as ValueNotifier<DATA?>;
  }

  void clear() {
    _dataStateMap.clear();
  }
}
