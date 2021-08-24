import 'package:cueue/domain/usecase/hierarchy/menu/follow_all_menus_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/refresh_all_menus_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/menu/request_additional_all_menus_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/menu/menu_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MenuViewModel with ChangeNotifier {
  MenuViewModel(final FollowAllMenusUseCase followMenusUseCase, this._refreshMenusUseCase, this._requestAdditionMenusUseCase) {
    _compositeSubscription.add(followMenusUseCase().listen((state) {
      this.state = state.when(
        loading: (content) => (content != null) ? MenuState.loadingWithValue(content.createDateSplit()) : const MenuState.loading(),
        completed: (content, next, prev) => next.when(
          fixed: (_) => MenuState.completed(content.createDateSplit()),
          loading: () => MenuState.loadingWithValue(content.createDateSplit()),
          error: (exception) => MenuState.errorWithValue(content.createDateSplit(), exception),
        ),
        error: (exception) => MenuState.error(exception),
      );
    }));
  }

  final RefreshAllMenusUseCase _refreshMenusUseCase;
  final RequestAdditionalAllMenusUseCase _requestAdditionMenusUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  MenuState _state = const MenuState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  MenuState get state => _state;

  set state(final MenuState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> refresh() async {
    await _refreshMenusUseCase();
  }

  Future<void> retry() async {
    await refresh();
  }

  Future<void> requestAddition({final bool continueWhenError = false}) async {
    await _requestAdditionMenusUseCase(continueWhenError: continueWhenError);
  }

  Future<void> retryAddition() async {
    await requestAddition(continueWhenError: true);
  }
}
