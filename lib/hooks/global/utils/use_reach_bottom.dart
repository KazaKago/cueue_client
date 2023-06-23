import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useReachBottom(ScrollController scrollController, VoidCallback callback) {
  useEffect(
    () {
      void scrollHandler() {
        if (scrollController.offset >= scrollController.position.maxScrollExtent - 100.0 && !scrollController.position.outOfRange) {
          callback();
        }
      }

      scrollController.addListener(scrollHandler);
      return () => scrollController.removeListener(scrollHandler);
    },
    [scrollController],
  );
}
