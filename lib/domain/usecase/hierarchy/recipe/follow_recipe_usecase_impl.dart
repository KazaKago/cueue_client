import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/recipe/follow_recipe_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowRecipeUseCaseImpl implements FollowRecipeUseCase {
  const FollowRecipeUseCaseImpl(this._recipeRepository);

  final RecipeRepository _recipeRepository;

  @override
  Future<LoadingStateStream<Recipe>> call(final RecipeId recipeId) {
    return _recipeRepository.followData(recipeId);
  }
}
