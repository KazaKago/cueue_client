import 'package:cueue/data/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/cache/hierarchy/recipe/tagged_recipes_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:store_flowable/store_flowable.dart';

class TaggedRecipesFlowableFactory extends PaginationStoreFlowableFactory<TagId, List<RecipeId>> {
  TaggedRecipesFlowableFactory(this._recipeCache, this._taggedRecipesStateManager, this._getRecipesApi, this._recipeSummaryResponseMapper, this._userFlowableFactory) : super();

  final RecipeCache _recipeCache;
  final TaggedRecipesStateManager _taggedRecipesStateManager;
  final GetRecipesApi _getRecipesApi;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;
  final UserFlowableFactory _userFlowableFactory;

  @override
  FlowableDataStateManager<TagId> getFlowableDataStateManager() => _taggedRecipesStateManager;

  @override
  Future<List<RecipeId>?> loadDataFromCache(TagId param) async {
    return _recipeCache.taggedRecipeIds[param];
  }

  @override
  Future<void> saveDataToCache(List<RecipeId>? newData, TagId param) async {
    _recipeCache
      ..taggedRecipeIds[param] = newData
      ..taggedRecipeIdsCreatedAt[param] = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(List<RecipeId> cachedData, List<RecipeId> newData, TagId param) async {
    _recipeCache.taggedRecipeIds[param] = cachedData + newData;
  }

  @override
  Future<Fetched<List<RecipeId>>> fetchDataFromOrigin(TagId param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, tagId: param.value);
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
  Future<Fetched<List<RecipeId>>> fetchNextDataFromOrigin(String nextKey, TagId param) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, afterId: int.parse(nextKey), tagId: param.value);
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
  Future<bool> needRefresh(List<RecipeId>? cachedData, TagId param) async {
    final createdAt = _recipeCache.taggedRecipeIdsCreatedAt[param];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
