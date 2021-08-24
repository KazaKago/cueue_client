import 'dart:io';

import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/usecase/hierarchy/content/create_content_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/create_recipe_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/delete_recipe_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/update_recipe_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/presentation/viewmodel/global/editing_result.dart';
import 'package:cueue/presentation/viewmodel/hierarchy/recipe/recipe_editing_state.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class RecipeEditingViewModel with ChangeNotifier {
  RecipeEditingViewModel(final FollowTagsUseCase followTagsUseCase, this._refreshTagsUseCase, this._createRecipeUseCase, this._updateRecipeUseCase, this._deleteRecipeUseCase, this._createContentUseCase) {
    _compositeSubscription.add(followTagsUseCase().listen((state) {
      this.state = state.when(
        loading: (content) => const RecipeEditingState.loading(),
        completed: (content, next, prev) => RecipeEditingState.completed(content),
        error: (exception) => RecipeEditingState.error(exception),
      );
    }));
  }

  final RefreshTagsUseCase _refreshTagsUseCase;
  final CreateRecipeUseCase _createRecipeUseCase;
  final UpdateRecipeUseCase _updateRecipeUseCase;
  final DeleteRecipeUseCase _deleteRecipeUseCase;
  final CreateContentUseCase _createContentUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeEditingState _state = const RecipeEditingState.loading();
  bool _isLoading = false;
  bool _isCreatingImage = false;
  EditingResult? _completion;
  Exception? _exception;

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeEditingState get state => _state;

  set state(final RecipeEditingState state) {
    _state = state;
    notifyListeners();
  }

  EditingResult? get completion => _completion;

  set completion(final EditingResult? completion) {
    _completion = completion;
    notifyListeners();
  }

  Exception? get exception => _exception;

  set exception(final Exception? exception) {
    _exception = exception;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(final bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isCreatingImage => _isCreatingImage;

  set isCreatingImage(final bool isCreatingImage) {
    _isCreatingImage = isCreatingImage;
    notifyListeners();
  }

  Future<void> refresh() async {
    await _refreshTagsUseCase();
  }

  Future<void> retry() async {
    await refresh();
  }

  Future<Content?> createImage(final File imageFile) async {
    Content? content;
    isCreatingImage = true;
    try {
      content = await _createContentUseCase.call(ContentRegistration.fromFile(imageFile));
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isCreatingImage = false;
    return content;
  }

  Future<void> createRecipe(final String title, final String description, final String url, final List<Content> images, final List<TagId> tagIds) async {
    isLoading = true;
    try {
      final parsedUrl = url.isNotEmpty ? Uri.parse(url) : null;
      await _createRecipeUseCase(RecipeRegistration(title: title, description: description, url: parsedUrl, imageKeys: images.map((e) => e.key).toList(), tagIds: tagIds));
      completion = EditingResult.created;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> updateRecipe(final RecipeId recipeId, final String title, final String description, final String url, final List<Content> images, final List<TagId> tagIds) async {
    isLoading = true;
    try {
      final parsedUrl = url.isNotEmpty ? Uri.parse(url) : null;
      await _updateRecipeUseCase(recipeId, RecipeRegistration(title: title, description: description, url: parsedUrl, imageKeys: images.map((e) => e.key).toList(), tagIds: tagIds));
      completion = EditingResult.updated;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }

  Future<void> deleteRecipe(final RecipeId recipeId) async {
    isLoading = true;
    try {
      await _deleteRecipeUseCase(recipeId);
      completion = EditingResult.deleted;
    } on Exception catch (exception) {
      this.exception = exception;
    }
    isLoading = false;
  }
}
