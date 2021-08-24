import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/request_additional_tagged_recipes_usecase.dart';

class RequestAdditionalTaggedRecipesUseCaseImpl implements RequestAdditionalTaggedRecipesUseCase {
  const RequestAdditionalTaggedRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<void> call(final TagId tagId, {required final bool continueWhenError}) {
    return _recipeRepository.requestAdditionalTaggedData(tagId, continueWhenError: continueWhenError);
  }
}
