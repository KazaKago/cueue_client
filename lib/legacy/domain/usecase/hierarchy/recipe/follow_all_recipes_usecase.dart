import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowAllRecipesUseCase {
  LoadingStateStream<List<RecipeSummary>> call(RecipeSearchOption searchOption);
}
