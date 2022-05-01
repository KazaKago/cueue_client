import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteTagApi {
  const DeleteTagApi(this._dio);

  final Dio _dio;

  Future<void> execute(int workspaceId, int tagId) async {
    try {
      await _dio.delete<void>('/$workspaceId/tags/$tagId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
