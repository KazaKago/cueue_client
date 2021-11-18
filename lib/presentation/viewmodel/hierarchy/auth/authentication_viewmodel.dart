import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_password_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_password_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_in_with_password_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_up_with_password_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:flutter/foundation.dart';

class AuthenticationViewModel with ChangeNotifier {
  AuthenticationViewModel(this._shouldShowReauthenticationWithPasswordUseCase, this._shouldShowReauthenticationWithGoogleUseCase, this._shouldShowReauthenticationWithAppleUseCase, this._signUpWithPasswordUseCase, this._signInWithPasswordUseCase, this._authenticateWithGoogleUseCase, this._authenticateWithAppleUseCase, this._reauthenticateWithPasswordUseCase, this._reauthenticateWithGoogleUseCase, this._reauthenticateWithAppleUseCase) {
    _load();
  }

  final ShouldShowReauthenticationWithPasswordUseCase _shouldShowReauthenticationWithPasswordUseCase;
  final ShouldShowReauthenticationWithGoogleUseCase _shouldShowReauthenticationWithGoogleUseCase;
  final ShouldShowReauthenticationWithAppleUseCase _shouldShowReauthenticationWithAppleUseCase;
  final SignUpWithPasswordUseCase _signUpWithPasswordUseCase;
  final SignInWithPasswordUseCase _signInWithPasswordUseCase;
  final AuthenticateWithGoogleUseCase _authenticateWithGoogleUseCase;
  final AuthenticateWithAppleUseCase _authenticateWithAppleUseCase;
  final ReauthenticateWithPasswordUseCase _reauthenticateWithPasswordUseCase;
  final ReauthenticateWithGoogleUseCase _reauthenticateWithGoogleUseCase;
  final ReauthenticateWithAppleUseCase _reauthenticateWithAppleUseCase;
  bool _isLoading = false;
  bool _shouldShowReauthenticationWithPassword = false;
  bool _shouldShowReauthenticationWithGoogle = false;
  bool _shouldShowReauthenticationWithApple = false;
  Event<void> _completionAuthenticationEvent = Event.initialize();
  Event<void> _completionReauthenticationEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get shouldShowReauthenticationWithPassword => _shouldShowReauthenticationWithPassword;

  set shouldShowReauthenticationWithPassword(final bool shouldShowReauthenticationWithPassword) {
    _shouldShowReauthenticationWithPassword = shouldShowReauthenticationWithPassword;
    notifyListeners();
  }

  bool get shouldShowReauthenticationWithGoogle => _shouldShowReauthenticationWithGoogle;

  set shouldShowReauthenticationWithGoogle(final bool shouldShowReauthenticationWithGoogle) {
    _shouldShowReauthenticationWithGoogle = shouldShowReauthenticationWithGoogle;
    notifyListeners();
  }

  bool get shouldShowReauthenticationWithApple => _shouldShowReauthenticationWithApple;

  set shouldShowReauthenticationWithApple(final bool shouldShowReauthenticationWithApple) {
    _shouldShowReauthenticationWithApple = shouldShowReauthenticationWithApple;
    notifyListeners();
  }

  Event<void> get completionAuthenticationEvent => _completionAuthenticationEvent;

  set completionAuthenticationEvent(final Event<void> completionAuthenticationEvent) {
    _completionAuthenticationEvent = completionAuthenticationEvent;
    notifyListeners();
  }

  Event<void> get completionReauthenticationEvent => _completionReauthenticationEvent;

  set completionReauthenticationEvent(final Event<void> completionReauthenticationEvent) {
    _completionReauthenticationEvent = completionReauthenticationEvent;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(final Event<Exception> exceptionEvent) {
    _exceptionEvent = exceptionEvent;
    notifyListeners();
  }

  Future<void> _load() async {
    final result = await Future.wait([
      _shouldShowReauthenticationWithPasswordUseCase(),
      _shouldShowReauthenticationWithGoogleUseCase(),
      _shouldShowReauthenticationWithAppleUseCase(),
    ]);
    shouldShowReauthenticationWithPassword = result[0];
    shouldShowReauthenticationWithGoogle = result[1];
    shouldShowReauthenticationWithApple = result[2];
  }

  Future<void> signUpWithPassword(final String emailStr, final String passwordStr, final String confirmationPasswordStr) async {
    isLoading = true;
    try {
      await _signUpWithPasswordUseCase(PasswordAuthInfo(email: Email(emailStr), password: Password.validateMatch(passwordStr, confirmationPasswordStr)));
      completionAuthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> signInWithPassword(final String emailStr, final String passwordStr) async {
    isLoading = true;
    try {
      await _signInWithPasswordUseCase(PasswordAuthInfo(email: Email(emailStr), password: Password(passwordStr)));
      completionAuthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> signInWithGoogle(final GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _authenticateWithGoogleUseCase(authInfo);
      completionAuthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> signInWithApple(final AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _authenticateWithAppleUseCase(authInfo);
      completionAuthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithPassword(final String passwordStr) async {
    isLoading = true;
    try {
      await _reauthenticateWithPasswordUseCase(Password(passwordStr));
      completionReauthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithGoogle(final GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _reauthenticateWithGoogleUseCase(authInfo);
      completionReauthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithApple(final AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _reauthenticateWithAppleUseCase(authInfo);
      completionReauthenticationEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
