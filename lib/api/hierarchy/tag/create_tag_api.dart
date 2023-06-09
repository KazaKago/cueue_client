import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/request/tag/tag_request.dart';
import 'package:cueue/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class CreateTagApi {
  const CreateTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<TagResponse> call(TagRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.post<Map<String, dynamic>>('/tags', data: request);
      return TagResponse.fromJson(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
