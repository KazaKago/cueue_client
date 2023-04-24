import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_key.dart';

class ContentResponseMapper {
  const ContentResponseMapper();

  Content call(ContentResponse response) {
    return Content(key: ContentKey(response.key), url: Uri.parse(response.url));
  }
}
