import 'dart:convert';
import 'dart:typed_data';

import 'package:cueue/data/api/request/content/content_request.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';

class ContentRequestMapper {
  const ContentRequestMapper();

  Future<ContentRequest> map(ContentRegistration contentRegistration, Future<Uint8List> Function(Uri uri) parseUri) async {
    return contentRegistration.when(
      file: (file) {
        final data = file.readAsBytesSync();
        return ContentRequest(data: base64Encode(data));
      },
      uri: (uri) async {
        final data = await parseUri(uri);
        return ContentRequest(data: base64Encode(data));
      },
    );
  }
}
