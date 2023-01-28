import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowRecipeUseCase {
  LoadingStateStream<Recipe> call(RecipeId recipeId);
}
