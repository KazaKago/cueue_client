import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class GetMenuApi {
  const GetMenuApi(this._dio);

  final Dio _dio;

  Future<MenuResponse> execute(int workspaceId, {required int menuId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/$workspaceId/menus/$menuId');
      return MenuResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
