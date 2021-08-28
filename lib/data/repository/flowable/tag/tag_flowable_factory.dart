import 'package:cueue/data/api/hierarchy/tag/get_tags_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/tag/tag_cache.dart';
import 'package:cueue/data/memory/hierarchy/tag/tag_state_manager.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:store_flowable/store_flowable.dart';

class TagFlowableFactory extends StoreFlowableFactory<void, List<Tag>> {
  TagFlowableFactory(this._getUserApi, this._getTagsApi, this._userResponseMapper, this._tagResponseMapper) : super();

  final GetUserApi _getUserApi;
  final GetTagsApi _getTagsApi;
  final UserResponseMapper _userResponseMapper;
  final TagResponseMapper _tagResponseMapper;

  @override
  void getKey() {}

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => TagStateManager.sharedInstance;

  @override
  Future<List<Tag>?> loadDataFromCache() async {
    return TagCache.sharedInstance.tags;
  }

  @override
  Future<void> saveDataToCache(final List<Tag>? newData) async {
    TagCache.sharedInstance.tags = newData;
    TagCache.sharedInstance.tagsCreatedAt = DateTime.now();
  }

  @override
  Future<List<Tag>> fetchDataFromOrigin() async {
    final user = await UserFlowableFactory(_getUserApi, _userResponseMapper).create().requireData();
    final response = await _getTagsApi.execute(user.currentWorkspace.id.value);
    return response.map(_tagResponseMapper.map).toList();
  }

  @override
  Future<bool> needRefresh(final List<Tag> cachedData) async {
    final createdAt = TagCache.sharedInstance.tagsCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
