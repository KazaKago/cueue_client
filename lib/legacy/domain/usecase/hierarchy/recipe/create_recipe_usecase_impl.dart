import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/create_recipe_usecase.dart';
import 'package:cueue/model/recipe/recipe_registration.dart';

class CreateRecipeUseCaseImpl implements CreateRecipeUseCase {
  const CreateRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeRegistration recipeRegistration) {
    return _recipeRepository.create(recipeRegistration);
  }
}
