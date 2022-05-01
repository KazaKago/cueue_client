import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';

class RecipeCache implements Cache {
  final Map<RecipeId, Recipe?> recipeMap = {};
  final Map<RecipeId, DateTime?> recipeCreatedAt = {};
  final Map<RecipeSearchOption, List<RecipeSummary>?> recipeSummaries = {};
  final Map<RecipeSearchOption, DateTime> recipeSummariesCreatedAt = {};

  @override
  void clearAll() {
    recipeMap.clear();
    recipeCreatedAt.clear();
    recipeSummaries.clear();
    recipeSummariesCreatedAt.clear();
  }
}
