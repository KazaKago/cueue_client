import 'package:cueue/api/hierarchy/recipe/get_recipe_api.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipe_state_manager.dart';
import 'package:cueue/mapper/recipe/recipe_response_mapper.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipeFlowableFactory extends StoreFlowableFactory<RecipeId, Recipe> {
  RecipeFlowableFactory(this._recipeCache, this._recipeStateManager, this._getRecipeApi, this._recipeResponseMapper) : super();

  final RecipeCache _recipeCache;
  final RecipeStateManager _recipeStateManager;
  final GetRecipeApi _getRecipeApi;
  final RecipeResponseMapper _recipeResponseMapper;

  @override
  FlowableDataStateManager<RecipeId> getFlowableDataStateManager() => _recipeStateManager;

  @override
  Future<Recipe?> loadDataFromCache(RecipeId param) async {
    return _recipeCache.recipeMap[param];
  }

  @override
  Future<void> saveDataToCache(Recipe? newData, RecipeId param) async {
    _recipeCache
      ..recipeMap[param] = newData
      ..recipeCreatedAt[param] = DateTime.now();
  }

  @override
  Future<Recipe> fetchDataFromOrigin(RecipeId param) async {
    final response = await _getRecipeApi(recipeId: param.value);
    return _recipeResponseMapper(response);
  }

  @override
  Future<bool> needRefresh(Recipe cachedData, RecipeId param) async {
    final createdAt = _recipeCache.recipeCreatedAt[param];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
