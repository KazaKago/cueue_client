import 'package:cueue/model/recipe/recipe_registration.dart';

abstract class CreateRecipeUseCase {
  Future<void> call(RecipeRegistration recipeRegistration);
}
