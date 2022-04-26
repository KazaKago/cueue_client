import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class RecipeRepository {
  LoadingStateStream<List<RecipeSummary>> followAllData();

  LoadingStateStream<List<RecipeSummary>> followTaggedData(TagId tagId);

  LoadingStateStream<Recipe> followData(RecipeId recipeId);

  Future<void> refreshAllData();

  Future<void> refreshTaggedData(TagId tagId);

  Future<void> refreshData(RecipeId recipeId);

  Future<void> requestAdditionalAllData({required bool continueWhenError});

  Future<void> requestAdditionalTaggedData(TagId tagId, {required bool continueWhenError});

  Future<void> create(RecipeRegistration recipe);

  Future<void> update(RecipeId recipeId, RecipeRegistration recipe);

  Future<void> delete(RecipeId recipeId);
}
