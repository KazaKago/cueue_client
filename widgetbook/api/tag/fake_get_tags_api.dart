import 'package:cueue/api/hierarchy/tag/get_tags_api.dart';
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
