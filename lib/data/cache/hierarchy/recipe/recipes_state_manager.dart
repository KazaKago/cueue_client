import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipesStateManager extends FlowableDataStateManager<RecipeSearchOption> implements Cache {}
