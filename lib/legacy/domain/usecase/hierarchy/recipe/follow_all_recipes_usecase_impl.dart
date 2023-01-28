import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/follow_all_recipes_usecase.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowAllRecipesUseCaseImpl implements FollowAllRecipesUseCase {
  const FollowAllRecipesUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  LoadingStateStream<List<RecipeSummary>> call(RecipeSearchOption searchOption) {
    return _recipeRepository.followAllData(searchOption);
  }
}
