import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_all_recipes_usecase.dart';

class RefreshAllRecipesUseCaseImpl implements RefreshAllRecipesUseCase {
  const RefreshAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call() {
    return _recipeRepository.refreshAllData();
  }
}
