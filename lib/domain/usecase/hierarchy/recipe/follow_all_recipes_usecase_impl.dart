import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_all_recipes_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowAllRecipesUseCaseImpl implements FollowAllRecipesUseCase {
  const FollowAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  LoadingStateStream<List<RecipeSummary>> call() {
    return _recipeRepository.followAllData();
  }
}
