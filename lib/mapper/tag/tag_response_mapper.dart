import 'package:cueue/api/response/tag/tag_response.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';

class TagResponseMapper {
  const TagResponseMapper();

  Tag call(TagResponse response) {
    return Tag(
      id: TagId(response.id),
      name: response.name,
    );
  }
}
