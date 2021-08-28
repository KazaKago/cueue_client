import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/recipe/recipe_selection_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeSelectionViewModel with ChangeNotifier {
  RecipeSelectionViewModel(this._followTagsUseCase, this._refreshTagsUseCase, this._selectedRecipes) {
    _follow();
  }

  final FollowTagsUseCase _followTagsUseCase;
  final RefreshTagsUseCase _refreshTagsUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeSelectionState _state = const RecipeSelectionState.loading();
  List<RecipeSummary> _selectedRecipes;

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeSelectionState get state => _state;

  set state(final RecipeSelectionState state) {
    _state = state;
    notifyListeners();
  }

  List<RecipeSummary> get selectedRecipes => _selectedRecipes;

  set selectedRecipes(final List<RecipeSummary> recipes) {
    _selectedRecipes = recipes;
    notifyListeners();
  }

  Future<void> _follow() async {
    final followTagsUseCase = await _followTagsUseCase();
    _compositeSubscription.add(followTagsUseCase.listen((state) {
      this.state = state.when(
        loading: (content) => const RecipeSelectionState.loading(),
        completed: (content, next, prev) => RecipeSelectionState.completed(content),
        error: (exception) => RecipeSelectionState.error(exception),
      );
    }));
  }

  Future<void> retry() async {
    await _refreshTagsUseCase();
  }
}
