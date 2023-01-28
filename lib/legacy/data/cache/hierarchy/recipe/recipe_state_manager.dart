import 'package:cueue/legacy/data/cache/hierarchy/cache.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipeStateManager extends FlowableDataStateManager<RecipeId> implements Cache {}
