import 'package:cueue/data/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/memory/hierarchy/recipe/tagged_recipes_state_manager.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:store_flowable/store_flowable.dart';

class TaggedRecipesFlowableFactory extends PaginationStoreFlowableFactory<TagId, List<RecipeId>> {
  TaggedRecipesFlowableFactory(this._getUserApi, this._getRecipesApi, this._userResponseMapper, this._recipeSummaryResponseMapper, this._tagId) : super();

  final GetUserApi _getUserApi;
  final GetRecipesApi _getRecipesApi;
  final UserResponseMapper _userResponseMapper;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;
  final TagId _tagId;

  @override
  TagId getKey() => _tagId;

  @override
  FlowableDataStateManager<TagId> getFlowableDataStateManager() => TaggedRecipesStateManager.sharedInstance;

  @override
  Future<List<RecipeId>?> loadDataFromCache() async {
    return RecipeCache.sharedInstance.taggedRecipeIds[_tagId];
  }

  @override
  Future<void> saveDataToCache(final List<RecipeId>? newData) async {
    RecipeCache.sharedInstance.taggedRecipeIds[_tagId] = newData;
    RecipeCache.sharedInstance.taggedRecipeIdsCreatedAt[_tagId] = DateTime.now();
  }

  @override
  Future<void> saveNextDataToCache(final List<RecipeId> cachedData, final List<RecipeId> newData) async {
    RecipeCache.sharedInstance.taggedRecipeIds[_tagId] = cachedData + newData;
  }

  @override
  Future<Fetched<List<RecipeId>>> fetchDataFromOrigin() async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, afterId: null, tagId: _tagId.value);
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
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final responses = await _getRecipesApi.execute(user.currentWorkspace.id.value, afterId: int.parse(nextKey), tagId: _tagId.value);
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
  Future<bool> needRefresh(final List<RecipeId>? cachedData) async {
    final createdAt = RecipeCache.sharedInstance.taggedRecipeIdsCreatedAt[_tagId];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
