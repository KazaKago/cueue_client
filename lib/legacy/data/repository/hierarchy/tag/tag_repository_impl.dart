import 'package:cueue/api/hierarchy/tag/order_tag_api.dart';
import 'package:cueue/api/mapper/tag/tag_order_request_mapper.dart';
import 'package:cueue/legacy/data/repository/flowable/tag/tag_flowable_factory.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:store_flowable/store_flowable.dart';

class TagRepositoryImpl implements TagRepository {
  const TagRepositoryImpl(this._orderTagApi, this._tagOrderRequestMapper, this._tagFlowableFactory);

  final OrderTagApi _orderTagApi;
  final TagOrderRequestMapper _tagOrderRequestMapper;
  final TagFlowableFactory _tagFlowableFactory;

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
  Future<void> reorder(List<TagId> tagIds) async {
    final tagFlowable = _tagFlowableFactory.create(null);
    final cachedTags = await tagFlowable.getData(from: GettingFrom.cache);
    if (cachedTags != null) {
      final tags = tagIds.map((tagId) => cachedTags.firstWhere((tag) => tag.id == tagId)).toList();
      await tagFlowable.update(tags);
    }

    try {
      await _orderTagApi(_tagOrderRequestMapper(tagIds));
    } on Exception {
      await tagFlowable.update(cachedTags);
      rethrow;
    }
  }
}
