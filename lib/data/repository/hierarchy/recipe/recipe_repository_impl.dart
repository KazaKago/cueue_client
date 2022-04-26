import 'package:cueue/data/api/hierarchy/recipe/create_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/delete_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/recipe/update_recipe_api.dart';
import 'package:cueue/data/cache/hierarchy/menu/menu_cache.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_response_mapper.dart';
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
  const RecipeRepositoryImpl(this._recipeCache, this._menuCache, this._createRecipeApi, this._updateRecipeApi, this._deleteRecipeApi, this._recipeResponseMapper, this._recipeRequestMapper, this._allRecipesFlowableFactory, this._taggedRecipesFlowableFactory, this._recipeFlowableFactory, this._userFlowableFactory, this._menuFlowableFactory, this._menuSummaryFlowableFactory);

  final RecipeCache _recipeCache;
  final MenuCache _menuCache;
  final CreateRecipeApi _createRecipeApi;
  final UpdateRecipeApi _updateRecipeApi;
  final DeleteRecipeApi _deleteRecipeApi;
  final RecipeResponseMapper _recipeResponseMapper;
  final RecipeRequestMapper _recipeRequestMapper;
  final AllRecipesFlowableFactory _allRecipesFlowableFactory;
  final TaggedRecipesFlowableFactory _taggedRecipesFlowableFactory;
  final RecipeFlowableFactory _recipeFlowableFactory;
  final UserFlowableFactory _userFlowableFactory;
  final MenuFlowableFactory _menuFlowableFactory;
  final MenuSummaryFlowableFactory _menuSummaryFlowableFactory;

  @override
  LoadingStateStream<List<RecipeSummary>> followAllData() {
    final allRecipeFlowable = _allRecipesFlowableFactory.create(null);
    return allRecipeFlowable.publish().mapContent((recipeIds) {
      return recipeIds.mapNotNull((recipeId) {
        return _recipeCache.recipeSummaryMap.value[recipeId];
      }).toList();
    });
  }

  @override
  LoadingStateStream<List<RecipeSummary>> followTaggedData(TagId tagId) {
    final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(tagId);
    return taggedRecipeFlowable.publish().mapContent((recipeIds) {
      return recipeIds.mapNotNull((recipeId) {
        return _recipeCache.recipeSummaryMap.value[recipeId];
      }).toList();
    });
  }

  @override
  LoadingStateStream<Recipe> followData(RecipeId recipeId) {
    final recipeFlowable = _recipeFlowableFactory.create(recipeId);
    return recipeFlowable.publish();
  }

  @override
  Future<void> refreshAllData() async {
    final recipeFlowable = _allRecipesFlowableFactory.create(null);
    await recipeFlowable.refresh();
  }

  @override
  Future<void> refreshTaggedData(TagId tagId) async {
    final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(tagId);
    await taggedRecipeFlowable.refresh();
  }

  @override
  Future<void> refreshData(RecipeId recipeId) async {
    final recipeFlowable = _recipeFlowableFactory.create(recipeId);
    return recipeFlowable.refresh();
  }

  @override
  Future<void> requestAdditionalAllData({required bool continueWhenError}) async {
    final recipeFlowable = _allRecipesFlowableFactory.create(null);
    await recipeFlowable.requestNextData(continueWhenError: continueWhenError);
  }

  @override
  Future<void> requestAdditionalTaggedData(TagId tagId, {required bool continueWhenError}) async {
    final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(tagId);
    await taggedRecipeFlowable.requestNextData(continueWhenError: continueWhenError);
  }

  @override
  Future<void> create(RecipeRegistration recipeRegistration) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _createRecipeApi.execute(user.currentWorkspace.id.value, _recipeRequestMapper.map(recipeRegistration));
    final recipe = _recipeResponseMapper.map(response);

    final cachedRecipeSummaryMap = _recipeCache.recipeSummaryMap.value;
    cachedRecipeSummaryMap[recipe.id] = recipe;
    _recipeCache.recipeSummaryMap.add(cachedRecipeSummaryMap);

    final recipeFlowable = _recipeFlowableFactory.create(recipe.id);
    await recipeFlowable.update(recipe);

    final allRecipeFlowable = _allRecipesFlowableFactory.create(null);
    final cachedAllRecipeIds = await allRecipeFlowable.getData(from: GettingFrom.cache);
    if (cachedAllRecipeIds != null) {
      final recipeIds = [recipe.id] + cachedAllRecipeIds;
      await allRecipeFlowable.update(recipeIds);
    }

    for (final tag in recipe.tags) {
      final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(tag.id);
      final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
      if (cachedTaggedRecipeIds != null) {
        final taggedRecipeIds = [recipe.id] + cachedTaggedRecipeIds;
        await taggedRecipeFlowable.update(taggedRecipeIds);
      }
    }
  }

  @override
  Future<void> update(RecipeId recipeId, RecipeRegistration recipeRegistration) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _updateRecipeApi.execute(user.currentWorkspace.id.value, recipeId.value, _recipeRequestMapper.map(recipeRegistration));
    final recipe = _recipeResponseMapper.map(response);

    final cachedRecipeSummaryMap = _recipeCache.recipeSummaryMap.value;
    cachedRecipeSummaryMap[recipe.id] = recipe;
    _recipeCache.recipeSummaryMap.add(cachedRecipeSummaryMap);

    final recipeFlowable = _recipeFlowableFactory.create(recipeId);
    await recipeFlowable.update(recipe);

    _recipeCache.taggedRecipeIds.forEach((key, value) async {
      if (!recipe.tags.map((e) => e.id).contains(key)) {
        final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(key);
        final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
        if (cachedTaggedRecipeIds != null) {
          final fixedTaggedRecipeIds = cachedTaggedRecipeIds.where((id) => id != recipe.id).toList();
          await taggedRecipeFlowable.update(fixedTaggedRecipeIds);
        }
      }
    });
    for (final tag in recipe.tags) {
      final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(tag.id);
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

    _menuCache.menuMap.forEach((menuId, menu) async {
      final menuFlowable = _menuFlowableFactory.create(menuId);
      final cachedMenus = await menuFlowable.getData(from: GettingFrom.cache);
      if (cachedMenus != null) {
        final menu = cachedMenus.copyWith(recipes: cachedMenus.recipes.map((e) => (e.id == recipe.id) ? recipe : e).toList());
        await menuFlowable.update(menu);
      }
    });

    final menuSummaryFlowable = _menuSummaryFlowableFactory.create(null);
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
  Future<void> delete(RecipeId recipeId) async {
    final user = await _userFlowableFactory.create(null).requireData();
    await _deleteRecipeApi.execute(user.currentWorkspace.id.value, recipeId.value);

    final cachedRecipeSummaryMap = _recipeCache.recipeSummaryMap.value..remove(recipeId);
    _recipeCache.recipeSummaryMap.add(cachedRecipeSummaryMap);

    final recipeFlowable = _recipeFlowableFactory.create(recipeId);
    await recipeFlowable.update(null);

    final allRecipeFlowable = _allRecipesFlowableFactory.create(null);
    final cachedAllRecipeIds = await allRecipeFlowable.getData(from: GettingFrom.cache);
    if (cachedAllRecipeIds != null) {
      final recipeIds = cachedAllRecipeIds.where((id) => id != recipeId).toList();
      await allRecipeFlowable.update(recipeIds);
    }

    _recipeCache.taggedRecipeIds.forEach((key, value) async {
      final taggedRecipeFlowable = _taggedRecipesFlowableFactory.create(key);
      final cachedTaggedRecipeIds = await taggedRecipeFlowable.getData(from: GettingFrom.cache);
      if (cachedTaggedRecipeIds != null) {
        final fixedTaggedRecipeIds = cachedTaggedRecipeIds.where((id) => id != recipeId).toList();
        await taggedRecipeFlowable.update(fixedTaggedRecipeIds);
      }
    });

    _menuCache.menuMap.forEach((menuId, menu) async {
      final menuFlowable = _menuFlowableFactory.create(menuId);
      final cachedMenus = await menuFlowable.getData(from: GettingFrom.cache);
      if (cachedMenus != null) {
        final menu = cachedMenus.copyWith(recipes: cachedMenus.recipes.where((e) => e.id != recipeId).toList());
        await menuFlowable.update(menu);
      }
    });

    final menuSummaryFlowable = _menuSummaryFlowableFactory.create(null);
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
