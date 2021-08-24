import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

extension ScrollControllerExtension on ScrollController {
  void onReachBottomWithAutoDispose(final VoidCallback callback) {
    useEffect(() {
      void scrollHandler() {
        if (offset >= position.maxScrollExtent - 100.0 && !position.outOfRange) {
          callback();
        }
      }

      addListener(scrollHandler);
      return () => removeListener(scrollHandler);
    }, [this]);
  }
}
