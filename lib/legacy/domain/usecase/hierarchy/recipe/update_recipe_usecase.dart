import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';

abstract class UpdateRecipeUseCase {
  Future<void> call(RecipeId recipeId, RecipeRegistration recipeRegistration);
}
