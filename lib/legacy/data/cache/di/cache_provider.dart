import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipes_state_manager.dart';
import 'package:cueue/legacy/data/cache/hierarchy/tag/tag_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/tag/tag_state_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeCacheProvider = Provider((ref) => RecipeCache());
final recipesStateManagerProvider = Provider((ref) => RecipesStateManager());
final tagCacheProvider = Provider((ref) => TagCache());
final tagStateManagerProvider = Provider((ref) => TagStateManager());
final allCacheProvider = Provider(
  (ref) => [
    ref.read(recipeCacheProvider),
    ref.read(recipesStateManagerProvider),
    ref.read(tagCacheProvider),
    ref.read(tagStateManagerProvider),
  ],
);
