import 'package:cueue/data/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipes_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_search_option.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipesFlowableFactory extends PaginationStoreFlowableFactory<RecipeSearchOption, List<RecipeSummary>> {
  RecipesFlowableFactory(this._recipeCache, this._recipesStateManager, this._getRecipesApi, this._recipeSummaryResponseMapper, this._userFlowableFactory) : super();

  final RecipeCache _recipeCache;
  final RecipesStateManager _recipesStateManager;
  final GetRecipesApi _getRecipesApi;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;
  final UserFlowableFactory _userFlowableFactory;

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
    final user = await _userFlowableFactory.create(null).requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, keyword: param.keyword, tagIds: param.tagIds?.map((e) => e.value).toList());
    final recipeIds = responses.map(_recipeSummaryResponseMapper.map).toList();
    return Fetched(
      data: recipeIds,
      nextKey: recipeIds.isNotEmpty ? recipeIds.last.id.value.toString() : null,
    );
  }

  @override
  Future<Fetched<List<RecipeSummary>>> fetchNextDataFromOrigin(String nextKey, RecipeSearchOption param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, afterId: int.parse(nextKey), keyword: param.keyword, tagIds: param.tagIds?.map((e) => e.value).toList());
    final recipeIds = responses.map(_recipeSummaryResponseMapper.map).toList();
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