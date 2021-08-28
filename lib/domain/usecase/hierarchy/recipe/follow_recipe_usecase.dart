import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowRecipeUseCase {
  Future<LoadingStateStream<Recipe>> call(final RecipeId recipeId);
}
