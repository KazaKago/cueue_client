import 'package:cueue/domain/model/hierarchy/auth/launch_check_result.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/check_at_launch_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/splash/splash_state.dart';
import 'package:flutter/foundation.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel(this._checkAtLaunchUseCase) {
    _loadNextRoute();
  }

  final CheckAtLaunchUseCase _checkAtLaunchUseCase;
  SplashState _state = const SplashState.loading();
  Event<LaunchCheckResult> _nextRouteEvent = Event.initialize();

  Event<LaunchCheckResult> get nextRouteEvent => _nextRouteEvent;

  SplashState get state => _state;

  set state(SplashState state) {
    _state = state;
    notifyListeners();
  }

  set nextRouteEvent(Event<LaunchCheckResult> nextRouteEvent) {
    _nextRouteEvent = nextRouteEvent;
    notifyListeners();
  }

  void retry() {
    _loadNextRoute();
  }

  Future<void> _loadNextRoute() async {
    state = const SplashState.loading();
    try {
      final result = await _checkAtLaunchUseCase();
      nextRouteEvent = Event(result);
    } on Exception catch (exception) {
      state = SplashState.error(exception);
    }
  }
}
