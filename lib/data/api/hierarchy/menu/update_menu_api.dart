import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/menu/menu_request.dart';
import 'package:cueue/data/api/response/menu/menu_response.dart';
import 'package:dio/dio.dart';

class UpdateMenuApi {
  const UpdateMenuApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<MenuResponse> execute(final int workspaceId, final int menuId, final MenuRequest request) async {
    try {
      final response = await _requester.create().patch<Map<String, dynamic>>('/$workspaceId/menus/$menuId', data: request);
      return MenuResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
