import 'package:cueue/data/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/data/cache/hierarchy/recipe/all_recipes_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable.dart';

class AllRecipesFlowableFactory extends PaginationStoreFlowableFactory<void, List<RecipeId>> {
  AllRecipesFlowableFactory(this._recipeCache, this._allRecipesStateManager, this._getRecipesApi, this._recipeSummaryResponseMapper, this._userFlowableFactory) : super();

  final RecipeCache _recipeCache;
  final AllRecipesStateManager _allRecipesStateManager;
  final GetRecipesApi _getRecipesApi;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;
  final UserFlowableFactory _userFlowableFactory;

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _allRecipesStateManager;

  @override
  Future<List<RecipeId>?> loadDataFromCache(void param) async {
    return _recipeCache.allRecipeIds;
  }

  @override
  Future<void> saveDataToCache(List<RecipeId>? newData, void param) async {
    _recipeCache
      ..allRecipeIds = newData
      ..allRecipeIdsCreatedAt = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(List<RecipeId> cachedData, List<RecipeId> newData, void param) async {
    _recipeCache.allRecipeIds = cachedData + newData;
  }

  @override
  Future<Fetched<List<RecipeId>>> fetchDataFromOrigin(void param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value);
    final recipeIds = responses.map((response) {
      final recipe = _recipeSummaryResponseMapper.map(response);
      _recipeCache.recipeSummaryMap.value[recipe.id] = recipe;
      return recipe.id;
    }).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<RecipeId>>> fetchNextDataFromOrigin(String nextKey, void param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, afterId: int.parse(nextKey));
    final recipeIds = responses.map((response) {
      final recipe = _recipeSummaryResponseMapper.map(response);
      _recipeCache.recipeSummaryMap.value[recipe.id] = recipe;
      return recipe.id;
    }).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(List<RecipeId> cachedData, void param) async {
    final createdAt = _recipeCache.allRecipeIdsCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
