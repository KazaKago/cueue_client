import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';

abstract class UpdateRecipeUseCase {
  Future<void> call(final RecipeId recipeId, final RecipeRegistration recipeRegistration);
}
