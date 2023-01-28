import 'package:cueue/api/request/tag/tag_order_request.dart';
import 'package:cueue/model/tag/tag_id.dart';

class TagOrderRequestMapper {
  const TagOrderRequestMapper();

  TagOrderRequest call(List<TagId> tagIds) {
    return TagOrderRequest(tagIds: tagIds.map((e) => e.value).toList());
  }
}
