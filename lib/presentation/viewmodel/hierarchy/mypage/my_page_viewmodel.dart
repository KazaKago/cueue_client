import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_out_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/refresh_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_user_display_name_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_user_photo_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/workspace/update_workspace_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/event.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/mypage/my_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_io/io.dart';

class MyPageViewModel with ChangeNotifier {
  MyPageViewModel(this._followUserUseCase, this._refreshUserUseCase, this._updateUserDisplayNameUseCase, this._updateUserPhotoUseCase, this._updateWorkspaceUseCase, this._signOutUseCase) {
    _follow();
  }

  final FollowUserUseCase _followUserUseCase;
  final RefreshUserUseCase _refreshUserUseCase;
  final UpdateUserDisplayNameUseCase _updateUserDisplayNameUseCase;
  final UpdateUserPhotoUseCase _updateUserPhotoUseCase;
  final UpdateWorkspaceUseCase _updateWorkspaceUseCase;
  final SignOutUseCase _signOutUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  MyPageState _state = const MyPageState.loading();
  bool _isLoading = false;
  Event<void> _signOutCompletionEvent = Event.initialize();
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

  Event<void> get signOutCompletionEvent => _signOutCompletionEvent;

  set signOutCompletionEvent(Event<void> signOutCompletionEvent) {
    _signOutCompletionEvent = signOutCompletionEvent;
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
      _signOutCompletionEvent = Event(null);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> updateDisplayName(String displayName) async {
    isLoading = true;
    try {
      await _updateUserDisplayNameUseCase.call(displayName);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> updatePhoto(File imageFile) async {
    isLoading = true;
    try {
      await _updateUserPhotoUseCase.call(ContentRegistration.fromFile(imageFile));
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> updateWorkspaceName(String workspaceName) async {
    isLoading = true;
    try {
      final registration = WorkspaceRegistration(name: workspaceName);
      await _updateWorkspaceUseCase.call(registration);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}
