import 'dart:typed_data';

import 'package:cueue/api/hierarchy/content/create_content_api.dart';
import 'package:cueue/api/hierarchy/content/get_bytes_from_uri_api.dart';
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

class FakeGetBytesFromUriApi implements GetBytesFromUriApi {
  const FakeGetBytesFromUriApi();

  @override
  Future<Uint8List> call(Uri uri) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Uint8List(0);
  }
}
