import 'dart:convert';

import 'package:cueue/data/api/request/content/content_request.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

class ContentRequestMapper {
  const ContentRequestMapper();

  ContentRequest map(ContentRegistration contentRegistration) {
    return ContentRequest(data: base64Encode(contentRegistration.data));
  }
}
