import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/request/menu/menu_request.dart';
import 'package:cueue/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class CreateMenuApi {
  const CreateMenuApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<MenuResponse> call(MenuRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.post<Map<String, dynamic>>('/menus', data: request);
      return MenuResponse.fromJson(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
