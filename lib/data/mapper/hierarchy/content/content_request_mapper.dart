import 'dart:convert';

import 'package:cueue/data/api/request/recipe/content_request.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

class ContentRequestMapper {
  const ContentRequestMapper();

  ContentRequest map(final ContentRegistration contentRegistration) {
    return ContentRequest(data: base64Encode(contentRegistration.data));
  }
}
