import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';

abstract class CreateRecipeUseCase {
  Future<void> call(RecipeRegistration recipeRegistration);
}
