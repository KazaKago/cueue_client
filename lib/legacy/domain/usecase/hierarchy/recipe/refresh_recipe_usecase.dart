import 'package:cueue/model/recipe/recipe_id.dart';

abstract class RefreshRecipeUseCase {
  Future<void> call(RecipeId recipeId);
}
