import 'package:cueue/data/api/hierarchy/tag/get_tags_api.dart';
import 'package:cueue/data/cache/hierarchy/tag/tag_cache.dart';
import 'package:cueue/data/cache/hierarchy/tag/tag_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:store_flowable/store_flowable.dart';

class TagFlowableFactory extends StoreFlowableFactory<void, List<Tag>> {
  TagFlowableFactory(this._tagCache, this._tagStateManager, this._getTagsApi, this._tagResponseMapper) : super();

  final TagCache _tagCache;
  final TagStateManager _tagStateManager;
  final GetTagsApi _getTagsApi;
  final TagResponseMapper _tagResponseMapper;

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _tagStateManager;

  @override
  Future<List<Tag>?> loadDataFromCache(void param) async {
    return _tagCache.tags;
  }

  @override
  Future<void> saveDataToCache(List<Tag>? newData, void param) async {
    _tagCache
      ..tags = newData
      ..tagsCreatedAt = DateTime.now();
  }

  @override
  Future<List<Tag>> fetchDataFromOrigin(void param) async {
    final response = await _getTagsApi.execute();
    return response.map(_tagResponseMapper.map).toList();
  }

  @override
  Future<bool> needRefresh(List<Tag> cachedData, void param) async {
    final createdAt = _tagCache.tagsCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
