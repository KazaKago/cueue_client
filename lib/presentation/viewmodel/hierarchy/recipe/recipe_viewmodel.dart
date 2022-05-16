import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_all_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_all_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/recipe/recipe_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeViewModel with ChangeNotifier {
  RecipeViewModel(this._followAllRecipesUseCase, this._refreshAllRecipesUseCase, this._requestAdditionalAllRecipesUseCase, this._recipeSearchOption) {
    _follow();
  }

  final RecipeSearchOption _recipeSearchOption;
  final FollowAllRecipesUseCase _followAllRecipesUseCase;
  final RefreshAllRecipesUseCase _refreshAllRecipesUseCase;
  final RequestAdditionalAllRecipesUseCase _requestAdditionalAllRecipesUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeState _state = const RecipeState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeState get state => _state;

  set state(RecipeState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    final followAllRecipesUseCase = _followAllRecipesUseCase(_recipeSearchOption);
    _compositeSubscription.add(
      followAllRecipesUseCase.listen((state) {
        this.state = state.when(
          loading: (content) => (content != null) ? RecipeState.refreshing(content) : const RecipeState.loading(),
          completed: (content, next, prev) => next.when(
            fixed: (_) => (content.isNotEmpty) ? RecipeState.completed(content) : const RecipeState.empty(),
            loading: () => RecipeState.additionalLoading(content),
            error: (exception) => RecipeState.additionalError(content, exception),
          ),
          error: RecipeState.error,
        );
      }),
    );
  }

  Future<void> refresh() async {
    await _refreshAllRecipesUseCase(_recipeSearchOption);
  }

  Future<void> retry() async {
    await refresh();
  }

  Future<void> requestAddition({bool continueWhenError = false}) async {
    await _requestAdditionalAllRecipesUseCase(_recipeSearchOption, continueWhenError: continueWhenError);
  }

  Future<void> retryAddition() async {
    await requestAddition(continueWhenError: true);
  }
}
