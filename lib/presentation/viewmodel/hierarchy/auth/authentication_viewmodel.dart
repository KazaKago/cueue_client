import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/sign_in_check_result.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_google_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class AuthenticationViewModel with ChangeNotifier {
  AuthenticationViewModel(this._shouldShowReauthenticationWithGoogleUseCase, this._shouldShowReauthenticationWithAppleUseCase, this._authenticateWithGoogleUseCase, this._authenticateWithAppleUseCase, this._reauthenticateWithGoogleUseCase, this._reauthenticateWithAppleUseCase) {
    _load();
  }

  final ShouldShowReauthenticationWithGoogleUseCase _shouldShowReauthenticationWithGoogleUseCase;
  final ShouldShowReauthenticationWithAppleUseCase _shouldShowReauthenticationWithAppleUseCase;
  final AuthenticateWithGoogleUseCase _authenticateWithGoogleUseCase;
  final AuthenticateWithAppleUseCase _authenticateWithAppleUseCase;
  final ReauthenticateWithGoogleUseCase _reauthenticateWithGoogleUseCase;
  final ReauthenticateWithAppleUseCase _reauthenticateWithAppleUseCase;
  bool _isLoading = false;
  bool _shouldShowReauthenticationWithGoogle = false;
  bool _shouldShowReauthenticationWithApple = false;
  Event<SignInCheckResult> _completionAuthenticationEvent = Event.initialize();
  Event<RequireReauthenticationException> _completionReauthenticationEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get shouldShowReauthenticationWithGoogle => _shouldShowReauthenticationWithGoogle;

  set shouldShowReauthenticationWithGoogle(bool shouldShowReauthenticationWithGoogle) {
    _shouldShowReauthenticationWithGoogle = shouldShowReauthenticationWithGoogle;
    notifyListeners();
  }

  bool get shouldShowReauthenticationWithApple => _shouldShowReauthenticationWithApple;

  set shouldShowReauthenticationWithApple(bool shouldShowReauthenticationWithApple) {
    _shouldShowReauthenticationWithApple = shouldShowReauthenticationWithApple;
    notifyListeners();
  }

  Event<SignInCheckResult> get completionAuthenticationEvent => _completionAuthenticationEvent;

  set completionAuthenticationEvent(Event<SignInCheckResult> completionAuthenticationEvent) {
    _completionAuthenticationEvent = completionAuthenticationEvent;
    notifyListeners();
  }

  Event<RequireReauthenticationException> get completionReauthenticationEvent => _completionReauthenticationEvent;

  set completionReauthenticationEvent(Event<RequireReauthenticationException> completionReauthenticationEvent) {
    _completionReauthenticationEvent = completionReauthenticationEvent;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exceptionEvent) {
    _exceptionEvent = exceptionEvent;
    notifyListeners();
  }

  Future<void> _load() async {
    final result = await Future.wait([
      _shouldShowReauthenticationWithGoogleUseCase(),
      _shouldShowReauthenticationWithAppleUseCase(),
    ]);
    shouldShowReauthenticationWithGoogle = result[0];
    shouldShowReauthenticationWithApple = result[1];
  }

  Future<void> signInWithGoogle(GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      final result = await _authenticateWithGoogleUseCase(authInfo);
      completionAuthenticationEvent = Event(result);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> signInWithApple(AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      final result = await _authenticateWithAppleUseCase(authInfo);
      completionAuthenticationEvent = Event(result);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithGoogle(GoogleAuthInfo authInfo, RequireReauthenticationException exception) async {
    isLoading = true;
    try {
      await _reauthenticateWithGoogleUseCase(authInfo, exception);
      completionReauthenticationEvent = Event(exception);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithApple(AppleAuthInfo authInfo, RequireReauthenticationException exception) async {
    isLoading = true;
    try {
      await _reauthenticateWithAppleUseCase(authInfo, exception);
      completionReauthenticationEvent = Event(exception);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
