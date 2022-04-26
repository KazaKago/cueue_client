import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/delete_recipe_usecase.dart';

class DeleteRecipeUseCaseImpl implements DeleteRecipeUseCase {
  const DeleteRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeId recipeId) {
    return _recipeRepository.delete(recipeId);
  }
}
