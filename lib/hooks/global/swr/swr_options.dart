import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cueue/hooks/global/swr/swr_lifecycle_observer.dart';
import 'package:cueue/hooks/global/swr/swr_validate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void revalidateOnMount<KEY, DATA>(SWRValidate<KEY, DATA> validate, KEY? key) {
  useEffect(
    () {
      Future.microtask(() => validate(key));
      return null;
    },
    [key],
  );
}

void revalidateOnFocus<KEY, DATA>(SWRValidate<KEY, DATA> validate, KEY? key) {
  useEffect(
    () {
      void callback(NavigatorEvent event) {
        switch (event) {
          case NavigatorEvent.resume:
            Future.microtask(() => validate(key));
            break;
          case NavigatorEvent.pause:
            // do nothing.
            break;
        }
      }

      swrLifecycleObserver.addObserver(callback);
      return () => swrLifecycleObserver.removeObserver(callback);
    },
    [key],
  );
}

void revalidateOnReconnect<KEY, DATA>(SWRValidate<KEY, DATA> validate, KEY? key) {
  useEffect(
    () {
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
            break;
          case ConnectivityResult.none:
            break;
        }
        previousResult = result;
      });
      return subscription.cancel;
    },
    [key],
  );
}
