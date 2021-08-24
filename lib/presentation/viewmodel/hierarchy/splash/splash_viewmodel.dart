import 'package:cueue/domain/usecase/hierarchy/auth/is_sign_in_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/splash/splash_route_pattern.dart';
import 'package:flutter/foundation.dart';

class SplashViewModel with ChangeNotifier {
  SplashViewModel(this._isSignInUseCase) {
    _loadNextRoute();
  }

  final IsSignInUseCase _isSignInUseCase;
  NextSplashRoutePattern? _nextRoute;

  NextSplashRoutePattern? get nextRoute => _nextRoute;

  set nextRoute(final NextSplashRoutePattern? nextRoute) {
    _nextRoute = nextRoute;
    notifyListeners();
  }

  Future<void> _loadNextRoute() async {
    final result = await Future.wait<dynamic>([
      _isSignInUseCase(),
      Future<void>.delayed(const Duration(seconds: 1)),
    ]);
    final isSignIn = result.first as bool;
    nextRoute = isSignIn ? NextSplashRoutePattern.main : NextSplashRoutePattern.welcome;
  }
}
