import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

enum NavigatorEvent {
  resume,
  pause,
}

final swrLifecycleObserver = SWRLifecycleObserver();

typedef LifecycleObserverCallback = void Function(NavigatorEvent event);

class SWRLifecycleObserver extends NavigatorObserver with WidgetsBindingObserver {
  SWRLifecycleObserver() {
    WidgetsBinding.instance.addObserver(this);
  }

  final Map<Route<dynamic>, Set<LifecycleObserverCallback>> _lifecycleObserverCallbacks = {};
  final List<Route<dynamic>> _routeStack = [];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _sendLifecycleEvent(_routeStack.lastOrNull, NavigatorEvent.resume);
      case AppLifecycleState.paused:
        _sendLifecycleEvent(_routeStack.lastOrNull, NavigatorEvent.pause);
      case AppLifecycleState.inactive:
        // do nothing.
        break;
      case AppLifecycleState.detached:
        // do nothing.
        break;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);

    _routeStack.add(route);

    _sendLifecycleEvent(previousRoute, NavigatorEvent.pause);
    _sendLifecycleEvent(route, NavigatorEvent.resume);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    _routeStack.remove(route);

    _sendLifecycleEvent(route, NavigatorEvent.pause);
    _sendLifecycleEvent(previousRoute, NavigatorEvent.resume);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);

    if (_routeStack.lastOrNull == route) {
      _sendLifecycleEvent(route, NavigatorEvent.pause);
      _sendLifecycleEvent(previousRoute, NavigatorEvent.resume);
    }
    _routeStack.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    final index = _routeStack.indexWhere((element) => element == oldRoute);
    if (_routeStack.lastOrNull == oldRoute) {
      _sendLifecycleEvent(oldRoute, NavigatorEvent.pause);
    }
    _routeStack.remove(oldRoute);

    if (index >= 0 && newRoute != null) {
      _routeStack.insert(index, newRoute);
    }
    if (_routeStack.lastOrNull == newRoute) {
      _sendLifecycleEvent(newRoute, NavigatorEvent.resume);
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  void addObserver(LifecycleObserverCallback callback) {
    if (_routeStack.isNotEmpty) _lifecycleObserverCallbacks.putIfAbsent(_routeStack.last, () => {}).add(callback);
  }

  void removeObserver(LifecycleObserverCallback callback) {
    if (_routeStack.isNotEmpty) _lifecycleObserverCallbacks.putIfAbsent(_routeStack.last, () => {}).remove(callback);
  }

  void _sendLifecycleEvent(Route<dynamic>? route, NavigatorEvent event) {
    if (route == null) {
      return;
    }
    final listeners = _lifecycleObserverCallbacks[route];
    if (listeners == null) {
      return;
    }
    for (final listener in listeners) {
      listener(event);
    }
  }
}
