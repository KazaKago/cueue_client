import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/delete_recipe_usecase.dart';
import 'package:cueue/model/recipe/recipe_id.dart';

class DeleteRecipeUseCaseImpl implements DeleteRecipeUseCase {
  const DeleteRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeId recipeId) {
    return _recipeRepository.delete(recipeId);
  }
}
