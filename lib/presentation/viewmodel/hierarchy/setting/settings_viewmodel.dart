import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/link_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/link_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/unlink_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/unlink_with_google_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/refresh_user_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/settings_result.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/setting/settings_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SettingsViewModel with ChangeNotifier {
  SettingsViewModel(this._followUserUseCase, this._refreshUserUseCase, this._linkWithGoogleUseCase, this._linkWithAppleUseCase, this._unlinkWithGoogleUseCase, this._unlinkWithAppleUseCase) {
    _follow();
  }

  final FollowUserUseCase _followUserUseCase;
  final RefreshUserUseCase _refreshUserUseCase;
  final LinkWithGoogleUseCase _linkWithGoogleUseCase;
  final LinkWithAppleUseCase _linkWithAppleUseCase;
  final UnlinkWithGoogleUseCase _unlinkWithGoogleUseCase;
  final UnlinkWithAppleUseCase _unlinkWithAppleUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  SettingsState _state = const SettingsState.loading();
  Event<SettingResult> _completionEvent = Event.initialize();
  bool _isLoading = false;
  Event<void> _replaceWelcomePageEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  SettingsState get state => _state;

  set state(SettingsState state) {
    _state = state;
    notifyListeners();
  }

  Event<SettingResult> get completionEvent => _completionEvent;

  set completionEvent(Event<SettingResult> completionEvent) {
    _completionEvent = completionEvent;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Event<void> get replaceWelcomePageEvent => _replaceWelcomePageEvent;

  set replaceWelcomePageEvent(Event<void> replaceWelcomePageEvent) {
    _replaceWelcomePageEvent = replaceWelcomePageEvent;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exceptionEvent) {
    _exceptionEvent = exceptionEvent;
    notifyListeners();
  }

  void _follow() {
    final followUserUseCase = _followUserUseCase();
    _compositeSubscription.add(
      followUserUseCase.listen((state) {
        this.state = state.when(
          loading: (user) => (user != null) ? SettingsState.completed(user) : const SettingsState.loading(),
          completed: (user, next, prev) => SettingsState.completed(user),
          error: SettingsState.error,
        );
      }),
    );
  }

  Future<void> linkWithGoogle(GoogleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _linkWithGoogleUseCase(authInfo);
      completionEvent = Event(SettingResult.linkedWithGoogle);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> linkWithApple(AppleAuthInfo authInfo) async {
    isLoading = true;
    try {
      await _linkWithAppleUseCase(authInfo);
      completionEvent = Event(SettingResult.linkedWithApple);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> unlinkWithGoogle() async {
    isLoading = true;
    try {
      await _unlinkWithGoogleUseCase();
      completionEvent = Event(SettingResult.unlinkedWithGoogle);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> unlinkWithApple() async {
    isLoading = true;
    try {
      await _unlinkWithAppleUseCase();
      completionEvent = Event(SettingResult.unlinkedWithApple);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> refresh() async {
    return _refreshUserUseCase();
  }
}
