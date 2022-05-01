import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase.dart';

class RequestAdditionalAllRecipesUseCaseImpl implements RequestAdditionalAllRecipesUseCase {
  const RequestAdditionalAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(RecipeSearchOption searchOption, {required bool continueWhenError}) {
    return _recipeRepository.requestAdditionalAllData(searchOption, continueWhenError: continueWhenError);
  }
}
