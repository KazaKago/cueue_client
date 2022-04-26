import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';

abstract class RefreshRecipeUseCase {
  Future<void> call(RecipeId recipeId);
}
