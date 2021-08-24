import 'package:cueue/data/api/response/content/content_response.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_key.dart';

class ContentResponseMapper {
  const ContentResponseMapper();

  Content map(final ContentResponse response) {
    return Content(key: ContentKey(response.key), url: Uri.parse(response.url));
  }
}
