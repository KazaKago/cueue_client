import 'package:cueue/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/api/mapper/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/recipe/recipes_state_manager.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipesFlowableFactory extends PaginationStoreFlowableFactory<RecipeSearchOption, List<RecipeSummary>> {
  RecipesFlowableFactory(this._recipeCache, this._recipesStateManager, this._getRecipesApi, this._recipeSummaryResponseMapper) : super();

  final RecipeCache _recipeCache;
  final RecipesStateManager _recipesStateManager;
  final GetRecipesApi _getRecipesApi;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;

  @override
  FlowableDataStateManager<RecipeSearchOption> getFlowableDataStateManager() => _recipesStateManager;

  @override
  Future<List<RecipeSummary>?> loadDataFromCache(RecipeSearchOption param) async {
    return _recipeCache.recipeSummaries[param];
  }

  @override
  Future<void> saveDataToCache(List<RecipeSummary>? newData, RecipeSearchOption param) async {
    _recipeCache
      ..recipeSummaries[param] = newData
      ..recipeSummariesCreatedAt[param] = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(List<RecipeSummary> cachedData, List<RecipeSummary> newData, RecipeSearchOption param) async {
    _recipeCache.recipeSummaries[param] = cachedData + newData;
  }

  @override
  Future<Fetched<List<RecipeSummary>>> fetchDataFromOrigin(RecipeSearchOption param) async {
    final responses = await _getRecipesApi(keyword: param.keyword, tagIds: param.tagIds?.map((e) => e.value).toList());
    final recipeIds = responses.map(_recipeSummaryResponseMapper.call).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.id.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<RecipeSummary>>> fetchNextDataFromOrigin(String nextKey, RecipeSearchOption param) async {
    final responses = await _getRecipesApi(afterId: int.parse(nextKey), keyword: param.keyword, tagIds: param.tagIds?.map((e) => e.value).toList());
    final recipeIds = responses.map(_recipeSummaryResponseMapper.call).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.id.value.toString() : null,
    );
  }

  @override
  Future<bool> needRefresh(List<RecipeSummary>? cachedData, RecipeSearchOption param) async {
    final createdAt = _recipeCache.recipeSummariesCreatedAt[param];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
