import 'dart:typed_data';

import 'package:cueue/api/hierarchy/content/get_bytes_from_uri_api.dart';

class FakeGetBytesFromUriApi implements GetBytesFromUriApi {
  const FakeGetBytesFromUriApi();

  @override
  Future<Uint8List> call(Uri uri) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Uint8List(0);
  }
}
