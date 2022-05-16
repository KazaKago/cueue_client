import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/follow_menu_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/refresh_menu_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/menu/menu_detail_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MenuDetailViewModel with ChangeNotifier {
  MenuDetailViewModel(this._followMenuUseCase, this._refreshMenuUseCase, this._menuId) {
    _follow();
  }

  final MenuId _menuId;
  final FollowMenuUseCase _followMenuUseCase;
  final RefreshMenuUseCase _refreshMenuUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  MenuDetailState _state = const MenuDetailState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  MenuDetailState get state => _state;

  set state(MenuDetailState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    final followMenuUseCase = _followMenuUseCase(_menuId);
    _compositeSubscription.add(
      followMenuUseCase.listen((state) {
        this.state = state.when(
          loading: (content) => (content != null) ? MenuDetailState.completed(content) : const MenuDetailState.loading(),
          completed: (content, next, prev) => MenuDetailState.completed(content),
          error: MenuDetailState.error,
        );
      }),
    );
  }

  Future<void> refresh() async {
    await _refreshMenuUseCase(_menuId);
  }

  Future<void> retry() async {
    await refresh();
  }
}
