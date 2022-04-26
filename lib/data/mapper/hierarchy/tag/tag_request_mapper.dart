import 'package:cueue/data/api/request/tag/tag_request.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';

class TagRequestMapper {
  const TagRequestMapper();

  TagRequest map(TagRegistration tagRegistration) {
    return TagRequest(name: tagRegistration.name);
  }
}
