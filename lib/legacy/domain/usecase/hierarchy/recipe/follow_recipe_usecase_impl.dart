import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/follow_recipe_usecase.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowRecipeUseCaseImpl implements FollowRecipeUseCase {
  const FollowRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  LoadingStateStream<Recipe> call(RecipeId recipeId) {
    return _recipeRepository.followData(recipeId);
  }
}
