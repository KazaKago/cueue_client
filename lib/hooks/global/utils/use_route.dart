import 'package:cueue/hooks/global/swr/swr_trigger_state.dart';
import 'package:cueue/hooks/global/swr/use_swr_trigger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class GoName {
  GoName(
    this.name, {
    this.pathParameters = const <String, String>{},
    this.queryParameters = const <String, dynamic>{},
    this.extra,
  });

  final String name;
  final Map<String, String> pathParameters;
  final Map<String, dynamic> queryParameters;
  final Object? extra;
}

SWRTriggerState<GoName, void> useGoNamed() {
  final context = useContext();
  return useSWRTrigger((goName) {
    return Future.microtask(() {
      return context.goNamed(
        goName.name,
        pathParameters: goName.pathParameters,
        queryParameters: goName.queryParameters,
        extra: goName.extra,
      );
    });
  });
}

SWRTriggerState<Widget, T?> usePushPage<T>() {
  final context = useContext();
  return useSWRTrigger((page) {
    return Future.microtask(() {
      return Navigator.push<T>(context, MaterialPageRoute(builder: (context) => page));
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
