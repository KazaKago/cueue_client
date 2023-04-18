import 'package:cueue/api/hierarchy/content/create_content_api.dart';
import 'package:cueue/api/request/content/content_request.dart';
import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/gen/assets.gen.dart';

class FakeCreateContentApi implements CreateContentApi {
  const FakeCreateContentApi();

  @override
  Future<ContentResponse> call(ContentRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return ContentResponse(
      key: 'key',
      url: Assets.images.time1Asa.path,
    );
  }
}
