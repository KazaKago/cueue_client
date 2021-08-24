import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/create_recipe_usecase.dart';

class CreateRecipeUseCaseImpl implements CreateRecipeUseCase {
  const CreateRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(final RecipeRegistration recipeRegistration) {
    return _recipeRepository.create(recipeRegistration);
  }
}
