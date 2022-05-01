import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class RecipeRepository {
  LoadingStateStream<List<RecipeSummary>> followAllData(RecipeSearchOption searchOption);

  LoadingStateStream<Recipe> followData(RecipeId recipeId);

  Future<void> refreshAllData(RecipeSearchOption searchOption);

  Future<void> refreshData(RecipeId recipeId);

  Future<void> requestAdditionalAllData(RecipeSearchOption searchOption, {required bool continueWhenError});

  Future<void> create(RecipeRegistration recipe);

  Future<void> update(RecipeId recipeId, RecipeRegistration recipe);

  Future<void> delete(RecipeId recipeId);
}
