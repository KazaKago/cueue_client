import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowTaggedRecipesUseCase {
  LoadingStateStream<List<RecipeSummary>> call(final TagId tagId);
}
