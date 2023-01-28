import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';

class RequestAdditionalAllRecipesUseCaseImpl implements RequestAdditionalAllRecipesUseCase {
  const RequestAdditionalAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeSearchOption searchOption, {required bool continueWhenError}) {
    return _recipeRepository.requestAdditionalAllData(searchOption, continueWhenError: continueWhenError);
  }
}
