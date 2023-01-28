import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/search/search_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SearchViewModel with ChangeNotifier {
  SearchViewModel(this._followTagsUseCase, this._refreshTagsUseCase) {
    _follow();
  }

  final FollowTagsUseCase _followTagsUseCase;
  final RefreshTagsUseCase _refreshTagsUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  SearchState _state = const SearchState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  SearchState get state => _state;

  set state(SearchState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    final followTagsUseCase = _followTagsUseCase();
    _compositeSubscription.add(
      followTagsUseCase.listen((state) {
        this.state = state.when(
          loading: (content) => const SearchState.loading(),
          completed: (content, next, prev) => SearchState.completed(content),
          error: SearchState.error,
        );
      }),
    );
  }

  Future<void> refresh() async {
    await _refreshTagsUseCase();
  }

  Future<void> retry() async {
    await refresh();
  }
}
