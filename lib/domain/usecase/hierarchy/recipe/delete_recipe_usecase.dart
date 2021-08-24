import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';

abstract class DeleteRecipeUseCase {
  Future<void> call(final RecipeId recipeId);
}
