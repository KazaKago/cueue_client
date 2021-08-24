import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/refresh_tagged_recipes_usecase.dart';

class RefreshTaggedRecipesUseCaseImpl implements RefreshTaggedRecipesUseCase {
  const RefreshTaggedRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(final TagId tagId) {
    return _recipeRepository.refreshTaggedData(tagId);
  }
}
