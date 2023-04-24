import 'package:cueue/api/request/tag/tag_request.dart';
import 'package:cueue/model/tag/tag_registration.dart';

class TagRequestMapper {
  const TagRequestMapper();

  TagRequest call(TagRegistration tagRegistration) {
    return TagRequest(name: tagRegistration.name);
  }
}
