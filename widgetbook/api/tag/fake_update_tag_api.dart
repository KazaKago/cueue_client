import 'package:cueue/api/hierarchy/tag/update_tag_api.dart';
import 'package:cueue/api/request/tag/tag_request.dart';
import 'package:cueue/api/response/tag/tag_response.dart';

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
