import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_recipe_usecase.dart';

class RefreshRecipeUseCaseImpl implements RefreshRecipeUseCase {
  const RefreshRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(final RecipeId recipeId) {
    return _recipeRepository.refreshData(recipeId);
  }
}
