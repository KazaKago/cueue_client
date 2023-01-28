import 'dart:math';

import 'package:collection/collection.dart';
import 'package:cueue/api/hierarchy/tag/create_tag_api.dart';
import 'package:cueue/api/hierarchy/tag/delete_tag_api.dart';
import 'package:cueue/api/hierarchy/tag/get_tags_api.dart';
import 'package:cueue/api/hierarchy/tag/order_tag_api.dart';
import 'package:cueue/api/hierarchy/tag/update_tag_api.dart';
import 'package:cueue/api/request/tag/tag_order_request.dart';
import 'package:cueue/api/request/tag/tag_request.dart';
import 'package:cueue/api/response/tag/tag_response.dart';

class FakeGetTagsApi implements GetTagsApi {
  const FakeGetTagsApi();

  @override
  Future<List<TagResponse>> call() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return [
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
  }
}

class FakeCreateTagApi implements CreateTagApi {
  const FakeCreateTagApi();

  @override
  Future<TagResponse> call(TagRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return TagResponse(
      id: Random().nextInt(10000),
      name: request.name,
    );
  }
}

class FakeUpdateTagApi implements UpdateTagApi {
  const FakeUpdateTagApi();

  @override
  Future<TagResponse> call(int tagId, TagRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return TagResponse(
      id: tagId,
      name: request.name,
    );
  }
}

class FakeDeleteTagApi implements DeleteTagApi {
  const FakeDeleteTagApi();

  @override
  Future<void> call(int tagId) async {
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}

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
