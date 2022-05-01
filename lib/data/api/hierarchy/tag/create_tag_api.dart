import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/tag/tag_request.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class CreateTagApi {
  const CreateTagApi(this._dio);

  final Dio _dio;

  Future<TagResponse> execute(int workspaceId, TagRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/$workspaceId/tags', data: request);
      return TagResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
