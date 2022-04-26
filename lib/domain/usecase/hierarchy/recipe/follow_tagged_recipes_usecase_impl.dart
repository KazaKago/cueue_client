import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_tagged_recipes_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowTaggedRecipesUseCaseImpl implements FollowTaggedRecipesUseCase {
  const FollowTaggedRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  LoadingStateStream<List<RecipeSummary>> call(TagId tagId) {
    return _recipeRepository.followTaggedData(tagId);
  }
}
