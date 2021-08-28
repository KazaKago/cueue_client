import 'package:cueue/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/tag/tag_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class TagViewModel with ChangeNotifier {
  TagViewModel(this._followTagsUseCase, this._refreshTagsUseCase) {
    _follow();
  }

  final FollowTagsUseCase _followTagsUseCase;
  final RefreshTagsUseCase _refreshTagsUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  TagState _state = const TagState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  TagState get state => _state;

  set state(final TagState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> _follow() async {
    final followTagsUseCase = await _followTagsUseCase();
    _compositeSubscription.add(followTagsUseCase.listen((state) {
      this.state = state.when(
        loading: (tags) => (tags != null) ? TagState.completed(tags) : const TagState.loading(),
        completed: (tags, next, prev) => TagState.completed(tags),
        error: (exception) => TagState.error(exception),
      );
    }));
  }

  Future<void> refresh() async {
    await _refreshTagsUseCase();
  }

  Future<void> retry() async {
    await refresh();
  }
}
