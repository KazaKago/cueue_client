import 'package:cueue/data/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/recipe/all_recipes_state_manager.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable.dart';

class AllRecipesFlowableFactory extends PaginationStoreFlowableFactory<void, List<RecipeId>> {
  AllRecipesFlowableFactory(this._getRecipesApi, this._recipeSummaryResponseMapper) : super();

  final GetRecipesApi _getRecipesApi;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;

  @override
  void getKey() {}

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => AllRecipesStateManager.sharedInstance;

  @override
  Future<List<RecipeId>?> loadDataFromCache() async {
    return RecipeCache.sharedInstance.allRecipeIds;
  }

  @override
  Future<void> saveDataToCache(final List<RecipeId>? newData) async {
    RecipeCache.sharedInstance.allRecipeIds = newData;
    RecipeCache.sharedInstance.allRecipeIdsCreatedAt = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(final List<RecipeId> cachedData, final List<RecipeId> newData) async {
    RecipeCache.sharedInstance.allRecipeIds = cachedData + newData;
  }

  @override
  Future<Fetched<List<RecipeId>>> fetchDataFromOrigin() async {
    final responses = await _getRecipesApi.execute(afterId: null);
    final recipeIds = responses.map((response) {
      final recipe = _recipeSummaryResponseMapper.map(response);
      RecipeCache.sharedInstance.recipeSummaryMap.value[recipe.id] = recipe;
      return recipe.id;
    }).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<RecipeId>>> fetchNextDataFromOrigin(final String nextKey) async {
    final responses = await _getRecipesApi.execute(afterId: int.parse(nextKey));
    final recipeIds = responses.map((response) {
      final recipe = _recipeSummaryResponseMapper.map(response);
      RecipeCache.sharedInstance.recipeSummaryMap.value[recipe.id] = recipe;
      return recipe.id;
    }).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(final List<RecipeId> cachedData) async {
    final createdAt = RecipeCache.sharedInstance.allRecipeIdsCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
