import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase.dart';

class RequestAdditionalAllRecipesUseCaseImpl implements RequestAdditionalAllRecipesUseCase {
  const RequestAdditionalAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call({required final bool continueWhenError}) {
    return _recipeRepository.requestAdditionalAllData(continueWhenError: continueWhenError);
  }
}
