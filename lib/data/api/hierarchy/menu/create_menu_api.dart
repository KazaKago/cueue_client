import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/menu/menu_request.dart';
import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class CreateMenuApi {
  const CreateMenuApi(this._dio);

  final Dio _dio;

  Future<MenuResponse> execute(int workspaceId, MenuRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>('/$workspaceId/menus', data: request);
      return MenuResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
