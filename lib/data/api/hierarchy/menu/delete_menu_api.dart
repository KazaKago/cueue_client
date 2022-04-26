import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteMenuApi {
  const DeleteMenuApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<void> execute(int workspaceId, int menuId) async {
    try {
      await _requester.create().delete<void>('/$workspaceId/menus/$menuId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
