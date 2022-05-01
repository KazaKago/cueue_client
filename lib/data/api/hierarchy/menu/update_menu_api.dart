import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/menu/menu_request.dart';
import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class UpdateMenuApi {
  const UpdateMenuApi(this._dio);

  final Dio _dio;

  Future<MenuResponse> execute(int workspaceId, int menuId, MenuRequest request) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>('/$workspaceId/menus/$menuId', data: request);
      return MenuResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
