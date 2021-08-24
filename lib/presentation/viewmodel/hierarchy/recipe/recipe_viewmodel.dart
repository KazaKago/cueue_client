import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_all_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_tagged_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_all_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_tagged_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/request_additional_tagged_recipes_usecase.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/recipe/recipe_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeViewModel with ChangeNotifier {
  RecipeViewModel(final FollowAllRecipesUseCase followAllRecipesUseCase, final FollowTaggedRecipesUseCase followTaggedRecipesUseCase, this._refreshAllRecipesUseCase, this._refreshTaggedRecipesUseCase, this._requestAdditionalAllRecipesUseCase, this._requestAdditionalTaggedRecipesUseCase, this._tagId) {
    if (_tagId != null) {
      _compositeSubscription.add(followTaggedRecipesUseCase(_tagId!).listen((state) {
        this.state = state.when(
          loading: (content) => (content != null) ? RecipeState.loadingWithValue(content) : const RecipeState.loading(),
          completed: (content, next, prev) => next.when(
            fixed: (_) => RecipeState.completed(content),
            loading: () => RecipeState.loadingWithValue(content),
            error: (exception) => RecipeState.errorWithValue(content, exception),
          ),
          error: (exception) => RecipeState.error(exception),
        );
      }));
    } else {
      _compositeSubscription.add(followAllRecipesUseCase().listen((state) {
        this.state = state.when(
          loading: (content) => (content != null) ? RecipeState.loadingWithValue(content) : const RecipeState.loading(),
          completed: (content, next, prev) => next.when(
            fixed: (_) => RecipeState.completed(content),
            loading: () => RecipeState.loadingWithValue(content),
            error: (exception) => RecipeState.errorWithValue(content, exception),
          ),
          error: (exception) => RecipeState.error(exception),
        );
      }));
    }
  }

  final TagId? _tagId;
  final RefreshAllRecipesUseCase _refreshAllRecipesUseCase;
  final RefreshTaggedRecipesUseCase _refreshTaggedRecipesUseCase;
  final RequestAdditionalAllRecipesUseCase _requestAdditionalAllRecipesUseCase;
  final RequestAdditionalTaggedRecipesUseCase _requestAdditionalTaggedRecipesUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeState _state = const RecipeState.loading();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeState get state => _state;

  set state(final RecipeState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> refresh() async {
    if (_tagId != null) {
      await _refreshTaggedRecipesUseCase(_tagId!);
    } else {
      await _refreshAllRecipesUseCase();
    }
  }

  Future<void> retry() async {
    await refresh();
  }

  Future<void> requestAddition({final bool continueWhenError = false}) async {
    if (_tagId != null) {
      await _requestAdditionalTaggedRecipesUseCase(_tagId!, continueWhenError: continueWhenError);
    } else {
      await _requestAdditionalAllRecipesUseCase(continueWhenError: continueWhenError);
    }
  }

  Future<void> retryAddition() async {
    await requestAddition(continueWhenError: true);
  }
}
