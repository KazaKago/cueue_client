import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cueue/hooks/global/swr/swr_cache.dart';
import 'package:cueue/hooks/global/swr/swr_lifecycle_observer.dart';
import 'package:cueue/hooks/global/swr/swr_validate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void revalidateOnMountOption<KEY, DATA>(
  SWRValidate<KEY, DATA> validate,
  KEY? key, {
  required bool isEnabled,
  required DATA fallbackData,
}) {
  useEffect(
    () {
      final cache = swrCache.data<KEY?, DATA>(key).value;
      if (isEnabled || (fallbackData == null && cache == null)) {
        Future.microtask(() => validate(key));
      }
      return null;
    },
    [key],
  );
}

void revalidateOnFocusOption<KEY, DATA>(
  SWRValidate<KEY, DATA> validate,
  KEY? key, {
  required bool isEnabled,
}) {
  useEffect(
    () {
      if (isEnabled) {
        void callback(NavigatorEvent event) {
          switch (event) {
            case NavigatorEvent.resume:
              Future.microtask(() => validate(key));
            case NavigatorEvent.pause:
              // do nothing.
              break;
          }
        }

        swrLifecycleObserver.addObserver(callback);
        return () => swrLifecycleObserver.removeObserver(callback);
      } else {
        return null;
      }
    },
    [key],
  );
}

void revalidateOnReconnectOption<KEY, DATA>(
  SWRValidate<KEY, DATA> validate,
  KEY? key, {
  required bool isEnabled,
}) {
  useEffect(
    () {
      if (isEnabled) {
        ConnectivityResult? previousResult;
        final subscription = Connectivity().onConnectivityChanged.listen((result) {
          switch (result) {
            case ConnectivityResult.bluetooth:
            case ConnectivityResult.wifi:
            case ConnectivityResult.ethernet:
            case ConnectivityResult.mobile:
            case ConnectivityResult.vpn:
            case ConnectivityResult.other:
              if (previousResult == ConnectivityResult.none) {
                Future.microtask(() => validate(key));
              }
            case ConnectivityResult.none:
              break;
          }
          previousResult = result;
        });
        return subscription.cancel;
      } else {
        return null;
      }
    },
    [key],
  );
}
