import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

final swrSystemCache = SWRSystemCache();

class SWRSystemCache {
  final Map<dynamic, ValueNotifier<Exception?>> _errorStateMap = {};
  final Map<dynamic, ValueNotifier<bool>> _isValidatingStateMap = {};

  ValueNotifier<Exception?> error<KEY>(KEY key) {
    return _errorStateMap.putIfAbsent(key, () => ValueNotifier<Exception?>(null));
  }

  ValueNotifier<bool> isValidating<KEY>(KEY key) {
    return _isValidatingStateMap.putIfAbsent(key, () => ValueNotifier<bool>(false));
  }

  void clear() {
    _errorStateMap.clear();
    _isValidatingStateMap.clear();
  }
}
