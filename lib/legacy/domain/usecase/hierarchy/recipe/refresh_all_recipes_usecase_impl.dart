import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/refresh_all_recipes_usecase.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';

class RefreshAllRecipesUseCaseImpl implements RefreshAllRecipesUseCase {
  const RefreshAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeSearchOption searchOption) {
    return _recipeRepository.refreshAllData(searchOption);
  }
}
