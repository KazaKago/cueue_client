import 'package:cueue/data/api/request/tag/tag_order_request.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';

class TagOrderRequestMapper {
  const TagOrderRequestMapper();

  TagOrderRequest map(List<TagId> tagIds) {
    return TagOrderRequest(tagIds: tagIds.map((e) => e.value).toList());
  }
}
