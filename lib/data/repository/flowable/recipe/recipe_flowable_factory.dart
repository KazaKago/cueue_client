import 'package:cueue/data/api/hierarchy/recipe/get_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_state_manager.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipeFlowableFactory extends StoreFlowableFactory<RecipeId, Recipe> {
  RecipeFlowableFactory(this._getUserApi, this._getRecipeApi, this._userResponseMapper, this._recipeResponseMapper, this._recipeId) : super();

  final GetUserApi _getUserApi;
  final GetRecipeApi _getRecipeApi;
  final UserResponseMapper _userResponseMapper;
  final RecipeResponseMapper _recipeResponseMapper;
  final RecipeId _recipeId;

  @override
  RecipeId getKey() => _recipeId;

  @override
  FlowableDataStateManager<RecipeId> getFlowableDataStateManager() => RecipeStateManager.sharedInstance;

  @override
  Future<Recipe?> loadDataFromCache() async {
    return RecipeCache.sharedInstance.recipeMap[_recipeId];
  }

  @override
  Future<void> saveDataToCache(final Recipe? newData) async {
    RecipeCache.sharedInstance.recipeMap[_recipeId] = newData;
    RecipeCache.sharedInstance.recipeCreatedAt[_recipeId] = DateTime.now();
  }

  @override
  Future<Recipe> fetchDataFromOrigin() async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _getRecipeApi.execute(user.currentWorkspace.id.value, recipeId: _recipeId.value);
    return _recipeResponseMapper.map(response);
  }

  @override
  Future<bool> needRefresh(final Recipe cachedData) async {
    final createdAt = RecipeCache.sharedInstance.recipeCreatedAt[_recipeId];
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
