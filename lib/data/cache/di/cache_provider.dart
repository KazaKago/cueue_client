import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_summary_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/recipe/all_recipes_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/recipe/tagged_recipes_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/tag/tag_cache.dart';
import 'package:cueue/data/cache/hierarchy/tag/tag_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final menuCacheProvider = Provider((ref) => MenuCache());
final menuStateManagerProvider = Provider((ref) => MenuStateManager());
final menuSummaryStateManagerProvider = Provider((ref) => MenuSummaryStateManager());
final recipeCacheProvider = Provider((ref) => RecipeCache());
final allRecipesStateManagerProvider = Provider((ref) => AllRecipesStateManager(ref.read(recipeCacheProvider)));
final recipeStateManagerProvider = Provider((ref) => RecipeStateManager());
final taggedRecipesStateManagerProvider = Provider((ref) => TaggedRecipesStateManager(ref.read(recipeCacheProvider)));
final tagCacheProvider = Provider((ref) => TagCache());
final tagStateManagerProvider = Provider((ref) => TagStateManager());
final userCacheProvider = Provider((ref) => UserCache());
final userStateManagerProvider = Provider((ref) => UserStateManager());
final allCacheProvider = Provider((ref) => [
      ref.read(menuCacheProvider),
      ref.read(menuStateManagerProvider),
      ref.read(menuSummaryStateManagerProvider),
      ref.read(recipeCacheProvider),
      ref.read(allRecipesStateManagerProvider),
      ref.read(recipeStateManagerProvider),
      ref.read(taggedRecipesStateManagerProvider),
      ref.read(tagCacheProvider),
      ref.read(tagStateManagerProvider),
      ref.read(userCacheProvider),
      ref.read(userStateManagerProvider),
    ]);
