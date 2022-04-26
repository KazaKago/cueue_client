import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/update_recipe_usecase.dart';

class UpdateRecipeUseCaseImpl implements UpdateRecipeUseCase {
  const UpdateRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeId recipeId, RecipeRegistration recipeRegistration) {
    return _recipeRepository.update(recipeId, recipeRegistration);
  }
}
