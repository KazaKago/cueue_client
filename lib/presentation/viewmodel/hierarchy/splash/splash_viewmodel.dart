import 'package:cueue/domain/model/hierarchy/auth/launch_check_result.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/check_at_launch_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel(this._checkAtLaunchUseCase) {
    _loadNextRoute();
  }

  final CheckAtLaunchUseCase _checkAtLaunchUseCase;
  Event<LaunchCheckResult> _nextRouteEvent = Event.initialize();

  Event<LaunchCheckResult> get nextRouteEvent => _nextRouteEvent;

  set nextRouteEvent(Event<LaunchCheckResult> nextRouteEvent) {
    _nextRouteEvent = nextRouteEvent;
    notifyListeners();
  }

  Future<void> _loadNextRoute() async {
    final result = await _checkAtLaunchUseCase();
    nextRouteEvent = Event(result);
  }
}
