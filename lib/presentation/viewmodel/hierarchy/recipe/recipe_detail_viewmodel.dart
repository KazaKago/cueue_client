import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_recipe_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_recipe_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/recipe/recipe_detail_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeDetailViewModel with ChangeNotifier {
  RecipeDetailViewModel(final FollowRecipeUseCase followRecipeUseCase, this._refreshRecipeUseCase, this._recipeId) {
    _compositeSubscription.add(followRecipeUseCase(_recipeId).listen((state) {
      this.state = state.when(
        loading: (content) => (content != null) ? RecipeDetailState.completed(content) : const RecipeDetailState.loading(),
        completed: (content, next, prev) => RecipeDetailState.completed(content),
        error: (exception) => RecipeDetailState.error(exception),
      );
    }));
  }

  final RecipeId _recipeId;
  final RefreshRecipeUseCase _refreshRecipeUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeDetailState _state = const RecipeDetailState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeDetailState get state => _state;

  set state(final RecipeDetailState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> refresh() async {
    await _refreshRecipeUseCase(_recipeId);
  }

  Future<void> retry() async {
    await refresh();
  }
}
