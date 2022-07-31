import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_out_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/refresh_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_avatar_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_display_name_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/mypage/my_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_io/io.dart';

class MyPageViewModel with ChangeNotifier {
  MyPageViewModel(this._followUserUseCase, this._refreshUserUseCase, this._updateDisplayNameUseCase, this._updateAvatarUseCase, this._signOutUseCase) {
    _follow();
  }

  final FollowUserUseCase _followUserUseCase;
  final RefreshUserUseCase _refreshUserUseCase;
  final UpdateDisplayNameUseCase _updateDisplayNameUseCase;
  final UpdateAvatarUseCase _updateAvatarUseCase;
  final SignOutUseCase _signOutUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  MyPageState _state = const MyPageState.loading();
  bool _isLoading = false;
  Event<void> _replaceWelcomePageEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  MyPageState get state => _state;

  set state(MyPageState state) {
    _state = state;
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
    _compositeSubscription.add(
      _followUserUseCase().listen((state) {
        this.state = state.when(
          loading: (user) => (user != null) ? MyPageState.completed(user) : const MyPageState.loading(),
          completed: (user, next, prev) => MyPageState.completed(user),
          error: MyPageState.error,
        );
      }),
    );
  }

  Future<void> refresh() async {
    await _refreshUserUseCase();
  }

  Future<void> retry() async {
    await _refreshUserUseCase();
  }

  Future<void> signOut() async {
    isLoading = true;
    try {
      await _signOutUseCase();
      _replaceWelcomePageEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> updateDisplayName(String displayName) async {
    isLoading = true;
    try {
      await _updateDisplayNameUseCase.call(displayName);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> updatePhoto(File imageFile) async {
    isLoading = true;
    try {
      await _updateAvatarUseCase.call(ContentRegistration.fromFile(imageFile));
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
