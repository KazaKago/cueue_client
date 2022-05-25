import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/user/refresh_user_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/mypage/my_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MyPageViewModel with ChangeNotifier {
  MyPageViewModel(this._followUserUseCase, this._refreshUserUseCase) {
    _follow();
  }

  final FollowUserUseCase _followUserUseCase;
  final RefreshUserUseCase _refreshUserUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  MyPageState _state = const MyPageState.loading();

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
}
