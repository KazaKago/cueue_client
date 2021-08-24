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
import 'package:cueue/presentation/viewmodel/global/unit.dart';
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
  Unit? _completionAuthentication;
  Unit? _completionReauthentication;
  Exception? _exception;

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

  Unit? get completionAuthentication => _completionAuthentication;

  set completionAuthentication(final Unit? completionAuthentication) {
    _completionAuthentication = completionAuthentication;
    notifyListeners();
  }

  Unit? get completionReauthentication => _completionReauthentication;

  set completionReauthentication(final Unit? completionReauthentication) {
    _completionReauthentication = completionReauthentication;
    notifyListeners();
  }

  Exception? get exception => _exception;

  set exception(final Exception? exception) {
    _exception = exception;
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
      completionAuthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> signInWithPassword(final String emailStr, final String passwordStr) async {
    isLoading = true;
    try {
      await _signInWithPasswordUseCase(PasswordAuthInfo(email: Email(emailStr), password: Password(passwordStr)));
      completionAuthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> signInWithGoogle(final GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _authenticateWithGoogleUseCase(authInfo);
      completionAuthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> signInWithApple(final AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _authenticateWithAppleUseCase(authInfo);
      completionAuthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithPassword(final String passwordStr) async {
    isLoading = true;
    try {
      await _reauthenticateWithPasswordUseCase(Password(passwordStr));
      completionReauthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithGoogle(final GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _reauthenticateWithGoogleUseCase(authInfo);
      completionReauthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> reauthorizeWithApple(final AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _reauthenticateWithAppleUseCase(authInfo);
      completionReauthentication = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }
}
