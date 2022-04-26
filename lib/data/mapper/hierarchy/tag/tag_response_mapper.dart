import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';

class TagResponseMapper {
  const TagResponseMapper();

  Tag map(TagResponse response) {
    return Tag(
      id: TagId(response.id),
      name: response.name,
    );
  }
}
