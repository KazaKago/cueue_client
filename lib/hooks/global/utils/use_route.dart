import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

SWRTriggerState<Widget, T?> usePushPage<T>() {
  final context = useContext();
  return useSWRTrigger((page) {
    return Future.microtask(() {
      return Navigator.push<T>(context, MaterialPageRoute(builder: (context) => page));
    });
  });
}

SWRTriggerState<Widget, void> useReplacePage() {
  final context = useContext();
  return useSWRTrigger((page) {
    final pageRoute = PageRouteBuilder<Widget>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
    return Future.microtask(() {
      return Navigator.pushAndRemoveUntil<void>(context, pageRoute, (route) => false);
    });
  });
}

SWRTriggerState<T, void> usePopPage<T>() {
  final context = useContext();
  return useSWRTrigger((value) {
    return Future.microtask(() {
      return Navigator.of(context).pop(value);
    });
  });
}
