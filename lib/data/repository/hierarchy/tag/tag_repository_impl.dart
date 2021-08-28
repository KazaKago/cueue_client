import 'package:cueue/data/api/hierarchy/recipe/get_recipe_api.dart';
import 'package:cueue/data/api/hierarchy/tag/create_tag_api.dart';
import 'package:cueue/data/api/hierarchy/tag/delete_tag_api.dart';
import 'package:cueue/data/api/hierarchy/tag/get_tags_api.dart';
import 'package:cueue/data/api/hierarchy/tag/update_tag_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/mapper/hierarchy/recipe/recipe_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/repository/flowable/recipe/recipe_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/tag/tag_flowable_factory.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:store_flowable/store_flowable.dart';

class TagRepositoryImpl implements TagRepository {
  const TagRepositoryImpl(this._getUserApi, this._getTagsApi, this._createTagApi, this._updateTagApi, this._deleteTagApi, this._getRecipeApi, this._userResponseMapper, this._tagResponseMapper, this._tagRequestMapper, this._recipeResponseMapper);

  final GetUserApi _getUserApi;
  final GetTagsApi _getTagsApi;
  final CreateTagApi _createTagApi;
  final UpdateTagApi _updateTagApi;
  final DeleteTagApi _deleteTagApi;
  final GetRecipeApi _getRecipeApi;
  final UserResponseMapper _userResponseMapper;
  final TagResponseMapper _tagResponseMapper;
  final TagRequestMapper _tagRequestMapper;
  final RecipeResponseMapper _recipeResponseMapper;

  @override
  Future<LoadingStateStream<List<Tag>>> follow() {
    final tagFlowable = TagFlowableFactory(_getUserApi, _getTagsApi, _userResponseMapper, _tagResponseMapper).create();
    return tagFlowable.publish();
  }

  @override
  Future<void> refresh() async {
    final tagFlowable = TagFlowableFactory(_getUserApi, _getTagsApi, _userResponseMapper, _tagResponseMapper).create();
    return tagFlowable.refresh();
  }

  @override
  Future<void> create(final TagRegistration tagRegistration) async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _createTagApi.execute(user.currentWorkspace.id.value, _tagRequestMapper.map(tagRegistration));
    final tag = _tagResponseMapper.map(response);

    final tagFlowable = TagFlowableFactory(_getUserApi, _getTagsApi, _userResponseMapper, _tagResponseMapper).create();
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = cachedTags + [tag];
      await tagFlowable.update(tags);
    }
  }

  @override
  Future<void> update(final TagId tagId, final TagRegistration tagRegistration) async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _updateTagApi.execute(user.currentWorkspace.id.value, tagId.value, _tagRequestMapper.map(tagRegistration));
    final tag = _tagResponseMapper.map(response);

    final tagFlowable = TagFlowableFactory(_getUserApi, _getTagsApi, _userResponseMapper, _tagResponseMapper).create();
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = cachedTags.map((e) => (e.id == tag.id) ? tag : e).toList();
      await tagFlowable.update(tags);
    }

    final recipeIds = RecipeCache.sharedInstance.recipeMap.values.whereType<Recipe>().where((recipe) => recipe.tags.map((e) => e.id).contains(tag.id)).map((recipe) => recipe.id);
    for (final recipeId in recipeIds) {
      final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipeId).create();
      final cachedRecipe = await recipeFlowable.getData(from: GettingFrom.cache);
      if (cachedRecipe != null) {
        final fixedRecipe = cachedRecipe.copyWith(tags: cachedRecipe.tags.map((e) => (e.id == tag.id) ? tag : e).toList());
        await recipeFlowable.update(fixedRecipe);
      }
    }
  }

  @override
  Future<void> delete(final TagId tagId) async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    await _deleteTagApi.execute(user.currentWorkspace.id.value, tagId.value);

    final tagFlowable = TagFlowableFactory(_getUserApi, _getTagsApi, _userResponseMapper, _tagResponseMapper).create();
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = cachedTags.where((e) => e.id != tagId).toList();
      await tagFlowable.update(tags);
    }

    final recipeIds = RecipeCache.sharedInstance.recipeMap.values.whereType<Recipe>().where((recipe) => recipe.tags.map((e) => e.id).contains(tagId)).map((recipe) => recipe.id);
    for (final recipeId in recipeIds) {
      final recipeFlowable = RecipeFlowableFactory(_getUserApi, _getRecipeApi, _userResponseMapper, _recipeResponseMapper, recipeId).create();
      final cachedRecipe = await recipeFlowable.getData(from: GettingFrom.cache);
      if (cachedRecipe != null) {
        final fixedRecipe = cachedRecipe.copyWith(tags: cachedRecipe.tags.where((e) => e.id != tagId).toList());
        await recipeFlowable.update(fixedRecipe);
      }
    }
  }
}
