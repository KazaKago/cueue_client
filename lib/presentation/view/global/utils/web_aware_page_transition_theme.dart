import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebAwareTransitionTheme extends PageTransitionsTheme {
  factory WebAwareTransitionTheme() {
    if (kIsWeb) {
      return WebAwareTransitionTheme.web({
        for (final platform in TargetPlatform.values) platform: const _NoTransitionsBuilder(),
      });
    } else {
      return const WebAwareTransitionTheme.native();
    }
  }

  const WebAwareTransitionTheme.native() : super();

  const WebAwareTransitionTheme.web(Map<TargetPlatform, PageTransitionsBuilder> builders) : super(builders: builders);
}

class _NoTransitionsBuilder extends PageTransitionsBuilder {
  const _NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}
