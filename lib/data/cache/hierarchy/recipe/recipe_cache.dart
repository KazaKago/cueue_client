import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:rxdart/rxdart.dart';

class RecipeCache implements Cache {
  final BehaviorSubject<Map<RecipeId, RecipeSummary>> recipeSummaryMap = BehaviorSubject.seeded({}); // ignore: close_sinks
  final Map<RecipeId, Recipe?> recipeMap = {};
  final Map<RecipeId, DateTime?> recipeCreatedAt = {};
  List<RecipeId>? allRecipeIds;
  DateTime? allRecipeIdsCreatedAt;
  final Map<TagId, List<RecipeId>?> taggedRecipeIds = {};
  final Map<TagId, DateTime> taggedRecipeIdsCreatedAt = {};

  @override
  void clearAll() {
    recipeSummaryMap.value = {};
    recipeMap.clear();
    recipeCreatedAt.clear();
    allRecipeIds = null;
    allRecipeIdsCreatedAt = null;
    taggedRecipeIds.clear();
    taggedRecipeIdsCreatedAt.clear();
  }
}
