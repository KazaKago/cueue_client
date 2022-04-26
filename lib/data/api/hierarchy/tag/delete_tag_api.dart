import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteTagApi {
  const DeleteTagApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<void> execute(int workspaceId, int tagId) async {
    try {
      await _requester.create().delete<void>('/$workspaceId/tags/$tagId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
