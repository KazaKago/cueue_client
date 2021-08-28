import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/link_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/link_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_out_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/unlink_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/unlink_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/refresh_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/send_email_verification_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_email_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_password_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/unit.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/settings_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel with ChangeNotifier {
  SettingsViewModel(this._followUserUseCase, this._refreshUserUseCase, this._updateEmailUseCase, this._updatePasswordUseCase, this._linkWithGoogleUseCase, this._linkWithAppleUseCase, this._unlinkWithGoogleUseCase, this._unlinkWithAppleUseCase, this._signOutUseCase, this._sendEmailVerificationUseCase) {
    _follow();
  }

  final FollowUserUseCase _followUserUseCase;
  final RefreshUserUseCase _refreshUserUseCase;
  final UpdateEmailUseCase _updateEmailUseCase;
  final UpdatePasswordUseCase _updatePasswordUseCase;
  final LinkWithGoogleUseCase _linkWithGoogleUseCase;
  final LinkWithAppleUseCase _linkWithAppleUseCase;
  final UnlinkWithGoogleUseCase _unlinkWithGoogleUseCase;
  final UnlinkWithAppleUseCase _unlinkWithAppleUseCase;
  final SignOutUseCase _signOutUseCase;
  final SendEmailVerificationUseCase _sendEmailVerificationUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  SettingsState _state = const SettingsState.loading();
  bool _isLoading = false;
  Unit? _replaceWelcomePage;
  Exception? _exception;
  String? _toast;

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  SettingsState get state => _state;

  set state(final SettingsState state) {
    _state = state;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Unit? get replaceWelcomePage => _replaceWelcomePage;

  set replaceWelcomePage(final Unit? replaceWelcomePage) {
    _replaceWelcomePage = replaceWelcomePage;
    notifyListeners();
  }

  Exception? get exception => _exception;

  set exception(final Exception? exception) {
    _exception = exception;
    notifyListeners();
  }

  String? get toast => _toast;

  set toast(final String? toast) {
    _toast = toast;
    notifyListeners();
  }

  Future<void> _follow() async {
    final followUserUseCase = await _followUserUseCase();
    _compositeSubscription.add(followUserUseCase.listen((state) {
      this.state = state.when(
        loading: (user) => (user != null) ? SettingsState.completed(user) : const SettingsState.loading(),
        completed: (user, next, prev) => SettingsState.completed(user),
        error: (exception) => SettingsState.error(exception),
      );
    }));
  }

  Future<void> updateEmail(final String email) async {
    isLoading = true;
    try {
      await _updateEmailUseCase(Email(email));
      toast = 'メールアドレスを更新しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> updatePassword(final String password, final String reInputPassword) async {
    isLoading = true;
    try {
      await _updatePasswordUseCase(Password.validateMatch(password, reInputPassword));
      toast = 'パスワードを更新しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> linkWithGoogle(final GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _linkWithGoogleUseCase(authInfo);
      toast = 'Googleと\nアカウント連携しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> linkWithApple(final AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _linkWithAppleUseCase(authInfo);
      toast = 'Appleと\nアカウント連携しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> unlinkWithGoogle() async {
    isLoading = true;
    try {
      await _unlinkWithGoogleUseCase();
      toast = 'Googleとの\nアカウント連携を解除しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> unlinkWithApple() async {
    isLoading = true;
    try {
      await _unlinkWithAppleUseCase();
      toast = 'Appleとの\nアカウント連携を解除しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> signOut() async {
    isLoading = true;
    try {
      await _signOutUseCase();
      _replaceWelcomePage = const Unit();
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> refresh() async {
    return _refreshUserUseCase();
  }

  Future<void> sendEmailVerification(final Email email) async {
    isLoading = true;
    try {
      await _sendEmailVerificationUseCase();
      toast = '${email.value}\nへ認証メールを送信しました';
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }
}
