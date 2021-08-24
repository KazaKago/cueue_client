import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:rxdart/rxdart.dart';
import 'package:store_flowable/store_flowable.dart';

class TaggedRecipesStateManager extends FlowableDataStateManager<TagId> {
  static TaggedRecipesStateManager sharedInstance = TaggedRecipesStateManager();

  @override
  Stream<DataState> getFlow(final TagId key) {
    return CombineLatestStream.combine2<DataState, Map<RecipeId, RecipeSummary>, DataState>(super.getFlow(key), RecipeCache.sharedInstance.recipeSummaryMap, (state1, state2) => state1);
  }
}
