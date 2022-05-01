import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/recipe/content_request.dart';
import 'package:cueue/data/api/response/content/content_response.dart';
import 'package:dio/dio.dart';

class CreateContentApi {
  const CreateContentApi(this._dio);

  final Dio _dio;

  Future<ContentResponse> execute(ContentRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/contents', data: request);
      return ContentResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
