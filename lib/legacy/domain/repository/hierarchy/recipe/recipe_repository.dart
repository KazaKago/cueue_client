import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class RecipeRepository {
  LoadingStateStream<List<RecipeSummary>> followAllData(RecipeSearchOption searchOption);

  Future<void> refreshAllData(RecipeSearchOption searchOption);

  Future<void> requestAdditionalAllData(RecipeSearchOption searchOption, {required bool continueWhenError});

  Future<void> create(RecipeRegistration recipe);

  Future<void> update(RecipeId recipeId, RecipeRegistration recipe);

  Future<void> delete(RecipeId recipeId);
}
