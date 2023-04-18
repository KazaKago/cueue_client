import 'dart:math';

import 'package:cueue/api/hierarchy/tag/create_tag_api.dart';
import 'package:cueue/api/request/tag/tag_request.dart';
import 'package:cueue/api/response/tag/tag_response.dart';

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
