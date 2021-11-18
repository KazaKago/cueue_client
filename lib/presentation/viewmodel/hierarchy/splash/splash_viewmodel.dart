import 'package:cueue/domain/usecase/hierarchy/auth/is_sign_in_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/splash/splash_route_pattern.dart';
import 'package:flutter/foundation.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel(this._isSignInUseCase) {
    _loadNextRoute();
  }

  final IsSignInUseCase _isSignInUseCase;
  Event<NextSplashRoutePattern> _nextRouteEvent = Event.initialize();

  Event<NextSplashRoutePattern> get nextRouteEvent => _nextRouteEvent;

  set nextRouteEvent(final Event<NextSplashRoutePattern> nextRouteEvent) {
    _nextRouteEvent = nextRouteEvent;
    notifyListeners();
  }

  Future<void> _loadNextRoute() async {
    final result = await Future.wait<dynamic>([
      _isSignInUseCase(),
      Future<void>.delayed(const Duration(seconds: 1)),
    ]);
    final isSignIn = result.first as bool;
    nextRouteEvent = Event(isSignIn ? NextSplashRoutePattern.main : NextSplashRoutePattern.welcome);
  }
}
