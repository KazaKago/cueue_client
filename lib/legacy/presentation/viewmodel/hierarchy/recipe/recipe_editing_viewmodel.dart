import 'package:cueue/legacy/domain/usecase/hierarchy/content/create_content_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/create_recipe_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/delete_recipe_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/update_recipe_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/legacy/presentation/viewmodel/global/event.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_editing_state.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_registration.dart';
import 'package:cueue/model/edit/editing_result.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:universal_io/io.dart';

class RecipeEditingViewModel with ChangeNotifier {
  RecipeEditingViewModel(this._followTagsUseCase, this._refreshTagsUseCase, this._createRecipeUseCase, this._updateRecipeUseCase, this._deleteRecipeUseCase, this._createContentUseCase) {
    _follow();
  }

  final FollowTagsUseCase _followTagsUseCase;
  final RefreshTagsUseCase _refreshTagsUseCase;
  final CreateRecipeUseCase _createRecipeUseCase;
  final UpdateRecipeUseCase _updateRecipeUseCase;
  final DeleteRecipeUseCase _deleteRecipeUseCase;
  final CreateContentUseCase _createContentUseCase;
  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  RecipeEditingState _state = const RecipeEditingState.loading();
  bool _isLoading = false;
  bool _isCreatingImage = false;
  Event<EditingResult> _completionEvent = Event.initialize();
  Event<Exception> _exceptionEvent = Event.initialize();

  @override
  void dispose() {
    super.dispose();
    _compositeSubscription.dispose();
  }

  RecipeEditingState get state => _state;

  set state(RecipeEditingState state) {
    _state = state;
    notifyListeners();
  }

  Event<EditingResult> get completionEvent => _completionEvent;

  set completionEvent(Event<EditingResult> completion) {
    _completionEvent = completion;
    notifyListeners();
  }

  Event<Exception> get exceptionEvent => _exceptionEvent;

  set exceptionEvent(Event<Exception> exception) {
    _exceptionEvent = exception;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  bool get isCreatingImage => _isCreatingImage;

  set isCreatingImage(bool isCreatingImage) {
    _isCreatingImage = isCreatingImage;
    notifyListeners();
  }

  void _follow() {
    final followTagsUseCase = _followTagsUseCase();
    _compositeSubscription.add(
      followTagsUseCase.listen((state) {
        this.state = state.when(
          loading: (content) => const RecipeEditingState.loading(),
          completed: (content, next, prev) => RecipeEditingState.completed(content),
          error: RecipeEditingState.error,
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

  Future<Content?> createImage(File imageFile) async {
    Content? content;
    isCreatingImage = true;
    try {
      content = await _createContentUseCase(ContentRegistration.file(file: imageFile));
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isCreatingImage = false;
    return content;
  }

  Future<void> createRecipe(String title, String description, String url, List<Content> images, List<TagId> tagIds) async {
    isLoading = true;
    try {
      final parsedUrl = url.isNotEmpty ? Uri.parse(url) : null;
      await _createRecipeUseCase(RecipeRegistration(title: title, description: description, url: parsedUrl, imageKeys: images.map((e) => e.key).toList(), tagIds: tagIds));
      completionEvent = Event(EditingResult.created);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> updateRecipe(RecipeId recipeId, String title, String description, String url, List<Content> images, List<TagId> tagIds) async {
    isLoading = true;
    try {
      final parsedUrl = url.isNotEmpty ? Uri.parse(url) : null;
      await _updateRecipeUseCase(recipeId, RecipeRegistration(title: title, description: description, url: parsedUrl, imageKeys: images.map((e) => e.key).toList(), tagIds: tagIds));
      completionEvent = Event(EditingResult.updated);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }

  Future<void> deleteRecipe(RecipeId recipeId) async {
    isLoading = true;
    try {
      await _deleteRecipeUseCase(recipeId);
      completionEvent = Event(EditingResult.deleted);
    } on Exception catch (exception) {
      exceptionEvent = Event(exception);
    }
    isLoading = false;
  }
}