import 'package:cueue/data/api/hierarchy/tag/get_tags_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/cache/hierarchy/tag/tag_cache.dart';
import 'package:cueue/data/cache/hierarchy/tag/tag_state_manager.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:store_flowable/store_flowable.dart';

class TagFlowableFactory extends StoreFlowableFactory<void, List<Tag>> {
  TagFlowableFactory(this._userCache, this._userStateManager, this._tagCache, this._tagStateManager, this._getUserApi, this._getTagsApi, this._userResponseMapper, this._tagResponseMapper) : super();

  final UserCache _userCache;
  final UserStateManager _userStateManager;
  final TagCache _tagCache;
  final TagStateManager _tagStateManager;
  final GetUserApi _getUserApi;
  final GetTagsApi _getTagsApi;
  final UserResponseMapper _userResponseMapper;
  final TagResponseMapper _tagResponseMapper;

  @override
  void getKey() {}

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _tagStateManager;

  @override
  Future<List<Tag>?> loadDataFromCache() async {
    return _tagCache.tags;
  }

  @override
  Future<void> saveDataToCache(final List<Tag>? newData) async {
    _tagCache
      ..tags = newData
      ..tagsCreatedAt = DateTime.now();
  }

  @override
  Future<List<Tag>> fetchDataFromOrigin() async {
    final user = await UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create().requireData();
    final response = await _getTagsApi.execute(user.currentWorkspace.id.value);
    return response.map(_tagResponseMapper.map).toList();
  }

  @override
  Future<bool> needRefresh(final List<Tag> cachedData) async {
    final createdAt = _tagCache.tagsCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
