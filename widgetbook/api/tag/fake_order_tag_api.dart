import 'package:collection/collection.dart';
import 'package:cueue/api/hierarchy/tag/order_tag_api.dart';
import 'package:cueue/api/request/tag/tag_order_request.dart';
import 'package:cueue/api/response/tag/tag_response.dart';

class FakeOrderTagApi implements OrderTagApi {
  const FakeOrderTagApi();

  @override
  Future<List<TagResponse>> call(TagOrderRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    final tags = [
      const TagResponse(
        id: 0,
        name: 'tag name 1',
      ),
      const TagResponse(
        id: 1,
        name: 'tag name 2',
      ),
      const TagResponse(
        id: 2,
        name: 'tag name 3',
      ),
      const TagResponse(
        id: 3,
        name: 'tag name 4',
      ),
    ];
    return request.tagIds.map((tagId) => tags.firstWhereOrNull((tag) => tag.id == tagId)).whereNotNull().toList();
  }
}
