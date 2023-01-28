import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/refresh_recipe_usecase.dart';
import 'package:cueue/model/recipe/recipe_id.dart';

class RefreshRecipeUseCaseImpl implements RefreshRecipeUseCase {
  const RefreshRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeId recipeId) {
    return _recipeRepository.refreshData(recipeId);
  }
}
