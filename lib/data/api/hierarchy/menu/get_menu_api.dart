import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class GetMenuApi {
  const GetMenuApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<MenuResponse> execute({required final int menuId}) async {
    try {
      final response = await _requester.create().get<Map<String, dynamic>>('/menus/$menuId');
      return MenuResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
