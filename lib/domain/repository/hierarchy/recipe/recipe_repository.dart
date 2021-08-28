import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class RecipeRepository {
  Future<LoadingStateStream<List<RecipeSummary>>> followAllData();

  Future<LoadingStateStream<List<RecipeSummary>>> followTaggedData(final TagId tagId);

  Future<LoadingStateStream<Recipe>> followData(final RecipeId recipeId);

  Future<void> refreshAllData();

  Future<void> refreshTaggedData(final TagId tagId);

  Future<void> refreshData(final RecipeId recipeId);

  Future<void> requestAdditionalAllData({required final bool continueWhenError});

  Future<void> requestAdditionalTaggedData(final TagId tagId, {required final bool continueWhenError});

  Future<void> create(final RecipeRegistration recipe);

  Future<void> update(final RecipeId recipeId, final RecipeRegistration recipe);

  Future<void> delete(final RecipeId recipeId);
}
