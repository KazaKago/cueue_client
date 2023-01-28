import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_selection_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeSelectionViewModel with ChangeNotifier {
  RecipeSelectionViewModel(this._followTagsUseCase, this._refreshTagsUseCase) {
    _follow();
  }

  final FollowTagsUseCase _followTagsUseCase;
  final RefreshTagsUseCase _refreshTagsUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeSelectionState _state = const RecipeSelectionState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeSelectionState get state => _state;

  set state(RecipeSelectionState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    final followTagsUseCase = _followTagsUseCase();
    _compositeSubscription.add(
      followTagsUseCase.listen((state) {
        this.state = state.when(
          loading: (content) => const RecipeSelectionState.loading(),
          completed: (content, next, prev) => RecipeSelectionState.completed(content),
          error: RecipeSelectionState.error,
        );
      }),
    );
  }

  Future<void> retry() async {
    await _refreshTagsUseCase();
  }
}
