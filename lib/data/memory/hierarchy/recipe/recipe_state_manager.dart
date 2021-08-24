import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipeStateManager extends FlowableDataStateManager<RecipeId> {
  static RecipeStateManager sharedInstance = RecipeStateManager();
}
