import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_recipe_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_recipe_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/recipe/recipe_detail_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeDetailViewModel with ChangeNotifier {
  RecipeDetailViewModel(this._followRecipeUseCase, this._refreshRecipeUseCase, this._recipeId) {
    _follow();
  }

  final RecipeId _recipeId;
  final FollowRecipeUseCase _followRecipeUseCase;
  final RefreshRecipeUseCase _refreshRecipeUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeDetailState _state = const RecipeDetailState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeDetailState get state => _state;

  set state(RecipeDetailState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    final followRecipeUseCase = _followRecipeUseCase(_recipeId);
    _compositeSubscription.add(
      followRecipeUseCase.listen((state) {
        this.state = state.when(
          loading: (content) => (content != null) ? RecipeDetailState.completed(content) : const RecipeDetailState.loading(),
          completed: (content, next, prev) => RecipeDetailState.completed(content),
          error: RecipeDetailState.error,
        );
      }),
    );
  }

  Future<void> refresh() async {
    await _refreshRecipeUseCase(_recipeId);
  }

  Future<void> retry() async {
    await refresh();
  }
}
