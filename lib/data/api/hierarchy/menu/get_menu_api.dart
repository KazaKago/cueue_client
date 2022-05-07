import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class GetMenuApi {
  const GetMenuApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<MenuResponse> execute(int workspaceId, {required int menuId}) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<Map<String, dynamic>>('/$workspaceId/menus/$menuId');
      return MenuResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
