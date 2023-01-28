import 'package:cueue/model/recipe/recipe_id.dart';

abstract class DeleteRecipeUseCase {
  Future<void> call(RecipeId recipeId);
}
