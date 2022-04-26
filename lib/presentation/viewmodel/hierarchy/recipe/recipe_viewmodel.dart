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
  RecipeViewModel(this._followAllRecipesUseCase, this._followTaggedRecipesUseCase, this._refreshAllRecipesUseCase, this._refreshTaggedRecipesUseCase, this._requestAdditionalAllRecipesUseCase, this._requestAdditionalTaggedRecipesUseCase, this._tagId) {
    _follow();
  }

  final TagId? _tagId;
  final FollowAllRecipesUseCase _followAllRecipesUseCase;
  final FollowTaggedRecipesUseCase _followTaggedRecipesUseCase;
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

  set state(RecipeState state) {
    _state = state;
    notifyListeners();
  }

  void _follow() {
    if (_tagId != null) {
      final followTaggedRecipesUseCase = _followTaggedRecipesUseCase(_tagId!);
      _compositeSubscription.add(
        followTaggedRecipesUseCase.listen((state) {
          this.state = state.when(
            loading: (content) => (content != null) ? RecipeState.refreshing(content) : const RecipeState.loading(),
            completed: (content, next, prev) => next.when(
              fixed: (_) => (content.isNotEmpty) ? RecipeState.completed(content) : const RecipeState.empty(),
              loading: () => RecipeState.additionalLoading(content),
              error: (exception) => RecipeState.additionalError(content, exception),
            ),
            error: (exception) => RecipeState.error(exception),
          );
        }),
      );
    } else {
      final followAllRecipesUseCase = _followAllRecipesUseCase();
      _compositeSubscription.add(
        followAllRecipesUseCase.listen((state) {
          this.state = state.when(
            loading: (content) => (content != null) ? RecipeState.refreshing(content) : const RecipeState.loading(),
            completed: (content, next, prev) => next.when(
              fixed: (_) => (content.isNotEmpty) ? RecipeState.completed(content) : const RecipeState.empty(),
              loading: () => RecipeState.additionalLoading(content),
              error: (exception) => RecipeState.additionalError(content, exception),
            ),
            error: (exception) => RecipeState.error(exception),
          );
        }),
      );
    }
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

  Future<void> requestAddition({bool continueWhenError = false}) async {
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
