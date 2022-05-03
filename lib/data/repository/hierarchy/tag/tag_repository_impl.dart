import 'package:cueue/data/api/hierarchy/tag/create_tag_api.dart';
import 'package:cueue/data/api/hierarchy/tag/delete_tag_api.dart';
import 'package:cueue/data/api/hierarchy/tag/order_tag_api.dart';
import 'package:cueue/data/api/hierarchy/tag/update_tag_api.dart';
import 'package:cueue/data/cache/hierarchy/recipe/recipe_cache.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_order_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_response_mapper.dart';
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
  const TagRepositoryImpl(this._recipeCache, this._createTagApi, this._updateTagApi, this._deleteTagApi, this._orderTagApi, this._tagResponseMapper, this._tagRequestMapper, this._tagOrderRequestMapper, this._tagFlowableFactory, this._userFlowableFactory, this._recipeFlowableFactory);

  final RecipeCache _recipeCache;
  final CreateTagApi _createTagApi;
  final UpdateTagApi _updateTagApi;
  final DeleteTagApi _deleteTagApi;
  final OrderTagApi _orderTagApi;
  final TagResponseMapper _tagResponseMapper;
  final TagRequestMapper _tagRequestMapper;
  final TagOrderRequestMapper _tagOrderRequestMapper;
  final TagFlowableFactory _tagFlowableFactory;
  final UserFlowableFactory _userFlowableFactory;
  final RecipeFlowableFactory _recipeFlowableFactory;

  @override
  LoadingStateStream<List<Tag>> follow() {
    final tagFlowable = _tagFlowableFactory.create(null);
    return tagFlowable.publish();
  }

  @override
  Future<void> refresh() async {
    final tagFlowable = _tagFlowableFactory.create(null);
    return tagFlowable.refresh();
  }

  @override
  Future<void> create(TagRegistration tagRegistration) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _createTagApi.execute(user.currentWorkspace.id.value, _tagRequestMapper.map(tagRegistration));
    final tag = _tagResponseMapper.map(response);

    final tagFlowable = _tagFlowableFactory.create(null);
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = cachedTags + [tag];
      await tagFlowable.update(tags);
    }
  }

  @override
  Future<void> update(TagId tagId, TagRegistration tagRegistration) async {
    final user = await _userFlowableFactory.create(null).requireData();
    final response = await _updateTagApi.execute(user.currentWorkspace.id.value, tagId.value, _tagRequestMapper.map(tagRegistration));
    final tag = _tagResponseMapper.map(response);

    final tagFlowable = _tagFlowableFactory.create(null);
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = cachedTags.map((e) => (e.id == tag.id) ? tag : e).toList();
      await tagFlowable.update(tags);
    }

    final recipeIds = _recipeCache.recipeMap.values.whereType<Recipe>().where((recipe) => recipe.tags.map((e) => e.id).contains(tag.id)).map((recipe) => recipe.id);
    for (final recipeId in recipeIds) {
      final recipeFlowable = _recipeFlowableFactory.create(recipeId);
      final cachedRecipe = await recipeFlowable.getData(from: GettingFrom.cache);
      if (cachedRecipe != null) {
        final fixedRecipe = cachedRecipe.copyWith(tags: cachedRecipe.tags.map((e) => (e.id == tag.id) ? tag : e).toList());
        await recipeFlowable.update(fixedRecipe);
      }
    }
  }

  @override
  Future<void> delete(TagId tagId) async {
    final user = await _userFlowableFactory.create(null).requireData();
    await _deleteTagApi.execute(user.currentWorkspace.id.value, tagId.value);

    final tagFlowable = _tagFlowableFactory.create(null);
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = cachedTags.where((e) => e.id != tagId).toList();
      await tagFlowable.update(tags);
    }

    final recipeIds = _recipeCache.recipeMap.values.whereType<Recipe>().where((recipe) => recipe.tags.map((e) => e.id).contains(tagId)).map((recipe) => recipe.id);
    for (final recipeId in recipeIds) {
      final recipeFlowable = _recipeFlowableFactory.create(recipeId);
      final cachedRecipe = await recipeFlowable.getData(from: GettingFrom.cache);
      if (cachedRecipe != null) {
        final fixedRecipe = cachedRecipe.copyWith(tags: cachedRecipe.tags.where((e) => e.id != tagId).toList());
        await recipeFlowable.update(fixedRecipe);
      }
    }
  }

  @override
  Future<void> reorder(List<TagId> tagIds) async {
    final tagFlowable = _tagFlowableFactory.create(null);
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = tagIds.map((tagId) => cachedTags.firstWhere((tag) => tag.id == tagId)).toList();
      await tagFlowable.update(tags);
    }

    try {
      final user = await _userFlowableFactory.create(null).requireData();
      await _orderTagApi.execute(user.currentWorkspace.id.value, _tagOrderRequestMapper.map(tagIds));
    } on Exception {
      await tagFlowable.update(cachedTags);
      rethrow;
    }
  }
}
