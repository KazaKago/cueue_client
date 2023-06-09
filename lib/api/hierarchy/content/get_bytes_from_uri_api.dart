import 'dart:typed_data';

import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class GetBytesFromUriApi {
  const GetBytesFromUriApi();

  Future<Uint8List> call(Uri uri) async {
    try {
      final dio = Dio();
      final response = await dio.getUri<List<int>>(uri, options: Options(responseType: ResponseType.bytes));
      return Uint8List.fromList(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
