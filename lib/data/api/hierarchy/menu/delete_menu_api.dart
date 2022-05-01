import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteMenuApi {
  const DeleteMenuApi(this._dio);

  final Dio _dio;

  Future<void> execute(int workspaceId, int menuId) async {
    try {
      await _dio.delete<void>('/$workspaceId/menus/$menuId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
