import 'package:cueue/data/api/hierarchy/menu/get_menu_api.dart';
import 'package:cueue/data/api/hierarchy/menu/get_menus_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/create_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/delete_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/get_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/get_recipes_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/update_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/menu/menu_summary_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_summary_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/repository/flowable/menu/menu_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/menu/menu_summary_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/recipe/all_recipes_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/recipe/recipe_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/recipe/tagged_recipes_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/global/extension/iterable_extension.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary_impl.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_registration.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:store_flowable/store_flowable.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl(this._getUserApi, this._getRecipesApi, this._getRecipeApi, this._createRecipeApi, this._updateRecipeApi, this._deleteRecipeApi, this._getMenuApi, this._getMenusApi, this._userResponseMapper, this._recipeResponseMapper, this._recipeSummaryResponseMapper, this._recipeRequestMapper, this._menuSummaryResponseMapper, this._menuResponseMapper);

  final GetUserApi _getUserApi;
  final GetRecipesApi _getRecipesApi;
  final GetRecipeApi _getRecipeApi;
  final CreateRecipeApi _createRecipeApi;
  final UpdateRecipeApi _updateRecipeApi;
  final DeleteRecipeApi _deleteRecipeApi;
  final GetMenuApi _getMenuApi;
  final GetMenusApi _getMenusApi;
  final UserResponseMapper _userResponseMapper;
  final RecipeResponseMapper _recipeResponseMapper;
  final RecipeSummaryResponseMapper _recipeSummaryResponseMapper;
  final RecipeRequestMapper _recipeRequestMapper;
  final MenuSummaryResponseMapper _menuSummaryResponseMapper;
  final MenuResponseMapper _menuResponseMapper;

  @override
  Future<LoadingStateStream<List<RecipeSummary>>> followAllData() async {
    final allRecipeFlowable = AllRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper).create();
    return (await allRecipeFlowable.publish()).mapContent((recipeIds) {
      return recipeIds.mapNotNull((recipeId) {
        return RecipeCache.sharedInstance.recipeSummaryMap.value[recipeId];
      }).toList();
    });
  }

  @override
  Future<LoadingStateStream<List<RecipeSummary>>> followTaggedData(final TagId tagId) async {
    final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, tagId).create();
    return (await taggedRecipeFlowable.publish()).mapContent((recipeIds) {
      return recipeIds.mapNotNull((recipeId) {
        return RecipeCache.sharedInstance.recipeSummaryMap.value[recipeId];
      }).toList();
    });
  }

  @override
  Future<LoadingStateStream<Recipe>> followData(final RecipeId recipeId) {
    final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipeId).create();
    return recipeFlowable.publish();
  }

  @override
  Future<void> refreshAllData() async {
    final recipeFlowable = AllRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper).create();
    await recipeFlowable.refresh();
  }

  @override
  Future<void> refreshTaggedData(final TagId tagId) async {
    final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, tagId).create();
    await taggedRecipeFlowable.refresh();
  }

  @override
  Future<void> refreshData(final RecipeId recipeId) async {
    final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipeId).create();
    return recipeFlowable.refresh();
  }

  @override
  Future<void> requestAdditionalAllData({required final bool continueWhenError}) async {
    final recipeFlowable = AllRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper).create();
    await recipeFlowable.requestNextData(continueWhenError: continueWhenError);
  }

  @override
  Future<void> requestAdditionalTaggedData(final TagId tagId, {required final bool continueWhenError}) async {
    final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, tagId).create();
    await taggedRecipeFlowable.requestNextData(continueWhenError: continueWhenError);
  }

  @override
  Future<void> create(final RecipeRegistration recipeRegistration) async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _createRecipeApi.execute(user.currentWorkspace.id.value, _recipeRequestMapper.map(recipeRegistration));
    final recipe = _recipeResponseMapper.map(response);

    final cachedRecipeSummaryMap = RecipeCache.sharedInstance.recipeSummaryMap.value;
    cachedRecipeSummaryMap[recipe.id] = recipe;
    RecipeCache.sharedInstance.recipeSummaryMap.add(cachedRecipeSummaryMap);

    final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipe.id).create();
    await recipeFlowable.update(recipe);

    final allRecipeFlowable = AllRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper).create();
    final cachedAllRecipeIds = await allRecipeFlowable.getData(from: GettingFrom.cache);
    if (cachedAllRecipeIds != null) {
      final recipeIds = [recipe.id] + cachedAllRecipeIds;
      await allRecipeFlowable.update(recipeIds);
    }

    for (final tag in recipe.tags) {
      final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, tag.id).create();
      final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
      if (cachedTaggedRecipeIds != null) {
        final taggedRecipeIds = [recipe.id] + cachedTaggedRecipeIds;
        await taggedRecipeFlowable.update(taggedRecipeIds);
      }
    }
  }

  @override
  Future<void> update(final RecipeId recipeId, final RecipeRegistration recipeRegistration) async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _updateRecipeApi.execute(user.currentWorkspace.id.value, recipeId.value, _recipeRequestMapper.map(recipeRegistration));
    final recipe = _recipeResponseMapper.map(response);

    final cachedRecipeSummaryMap = RecipeCache.sharedInstance.recipeSummaryMap.value;
    cachedRecipeSummaryMap[recipe.id] = recipe;
    RecipeCache.sharedInstance.recipeSummaryMap.add(cachedRecipeSummaryMap);

    final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipe.id).create();
    await recipeFlowable.update(recipe);

    RecipeCache.sharedInstance.taggedRecipeIds.forEach((key, value) async {
      if (!recipe.tags.map((e) => e.id).contains(key)) {
        final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, key).create();
        final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
        if (cachedTaggedRecipeIds != null) {
          final fixedTaggedRecipeIds = cachedTaggedRecipeIds.where((id) => id != recipe.id).toList();
          await taggedRecipeFlowable.update(fixedTaggedRecipeIds);
        }
      }
    });
    for (final tag in recipe.tags) {
      final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, tag.id).create();
      final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
      if (cachedTaggedRecipeIds != null) {
        List<RecipeId> fixedTaggedRecipeIds;
        if (cachedTaggedRecipeIds.where((id) => id == recipe.id).isNotEmpty) {
          fixedTaggedRecipeIds = cachedTaggedRecipeIds.map((id) => (id == recipe.id) ? recipe.id : id).toList();
        } else {
          fixedTaggedRecipeIds = [recipe.id] + cachedTaggedRecipeIds;
        }
        await taggedRecipeFlowable.update(fixedTaggedRecipeIds);
      }
    }

    MenuCache.sharedInstance.menuMap.forEach((menuId, menu) async {
      final menuFlowable = MenuFlowableFactory(menuId, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper).create();
      final cachedMenus = await menuFlowable.getData(from: GettingFrom.cache);
      if (cachedMenus != null) {
        final menu = cachedMenus.copyWith(recipes: cachedMenus.recipes.map((e) => (e.id == recipe.id) ? recipe : e).toList());
        await menuFlowable.update(menu);
      }
    });

    final menuSummaryFlowable = MenuSummaryFlowableFactory(_getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menuSummaries = cachedMenuSummaries.map((menu) {
        return MenuSummaryImpl(
          id: menu.id,
          memo: menu.memo,
          date: menu.date,
          timeFrame: menu.timeFrame,
          recipes: menu.recipes.map((e) => (e.id == recipe.id) ? recipe : e).toList(),
        );
      }).toList();
      await menuSummaryFlowable.update(menuSummaries);
    }
  }

  @override
  Future<void> delete(final RecipeId recipeId) async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    await _deleteRecipeApi.execute(user.currentWorkspace.id.value, recipeId.value);

    final cachedRecipeSummaryMap = RecipeCache.sharedInstance.recipeSummaryMap.value..remove(recipeId);
    RecipeCache.sharedInstance.recipeSummaryMap.add(cachedRecipeSummaryMap);

    final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipeId).create();
    await recipeFlowable.update(null);

    final allRecipeFlowable = AllRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper).create();
    final cachedAllRecipeIds = await allRecipeFlowable.getData(from: GettingFrom.cache);
    if (cachedAllRecipeIds != null) {
      final recipeIds = cachedAllRecipeIds.where((id) => id != recipeId).toList();
      await allRecipeFlowable.update(recipeIds);
    }

    RecipeCache.sharedInstance.taggedRecipeIds.forEach((key, value) async {
      final taggedRecipeFlowable = TaggedRecipesFlowableFactory(_getUserApi, _getRecipesApi, _userResponseMapper, _recipeSummaryResponseMapper, key).create();
      final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
      if (cachedTaggedRecipeIds != null) {
        final fixedTaggedRecipeIds = cachedTaggedRecipeIds.where((id) => id != recipeId).toList();
        await taggedRecipeFlowable.update(fixedTaggedRecipeIds);
      }
    });

    MenuCache.sharedInstance.menuMap.forEach((menuId, menu) async {
      final menuFlowable = MenuFlowableFactory(menuId, _getUserApi, _getMenuApi, _userResponseMapper, _menuResponseMapper).create();
      final cachedMenus = await menuFlowable.getData(from: GettingFrom.cache);
      if (cachedMenus != null) {
        final menu = cachedMenus.copyWith(recipes: cachedMenus.recipes.where((e) => e.id != recipeId).toList());
        await menuFlowable.update(menu);
      }
    });

    final menuSummaryFlowable = MenuSummaryFlowableFactory(_getUserApi, _getMenusApi, _userResponseMapper, _menuSummaryResponseMapper).create();
    final cachedMenuSummaries = await menuSummaryFlowable.getData(from: GettingFrom.cache);
    if (cachedMenuSummaries != null) {
      final menuSummaries = cachedMenuSummaries.map((menu) {
        return MenuSummaryImpl(
          id: menu.id,
          memo: menu.memo,
          date: menu.date,
          timeFrame: menu.timeFrame,
          recipes: menu.recipes.where((e) => e.id != recipeId).toList(),
        );
      }).toList();
      await menuSummaryFlowable.update(menuSummaries);
    }
  }
}
