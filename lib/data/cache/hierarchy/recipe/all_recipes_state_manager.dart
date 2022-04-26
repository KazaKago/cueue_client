import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:rxdart/rxdart.dart';
import 'package:store_flowable/store_flowable.dart';

class AllRecipesStateManager extends FlowableDataStateManager<void> implements Cache {
  AllRecipesStateManager(this.recipeCache);

  final RecipeCache recipeCache;

  @override
  Stream<DataState> getFlow(void param) {
    return CombineLatestStream.combine2<DataState, Map<RecipeId, RecipeSummary>, DataState>(super.getFlow(param), recipeCache.recipeSummaryMap, (state1, state2) => state1);
  }
}
