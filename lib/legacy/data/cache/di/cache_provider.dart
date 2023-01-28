import 'package:cueue/legacy/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/legacy/data/cache/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipe_state_manager.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipes_state_manager.dart';
import 'package:cueue/legacy/data/cache/hierarchy/tag/tag_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/tag/tag_state_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final menuCacheProvider = Provider((ref) => MenuCache());
final menuStateManagerProvider = Provider((ref) => MenuStateManager());
final menuSummaryStateManagerProvider = Provider((ref) => MenuSummaryStateManager());
final recipeCacheProvider = Provider((ref) => RecipeCache());
final recipeStateManagerProvider = Provider((ref) => RecipeStateManager());
final recipesStateManagerProvider = Provider((ref) => RecipesStateManager());
final tagCacheProvider = Provider((ref) => TagCache());
final tagStateManagerProvider = Provider((ref) => TagStateManager());
final allCacheProvider = Provider(
  (ref) => [
    ref.read(menuCacheProvider),
    ref.read(menuStateManagerProvider),
    ref.read(menuSummaryStateManagerProvider),
    ref.read(recipeCacheProvider),
    ref.read(recipeStateManagerProvider),
    ref.read(recipesStateManagerProvider),
    ref.read(tagCacheProvider),
    ref.read(tagStateManagerProvider),
  ],
);
