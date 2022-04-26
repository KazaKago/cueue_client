import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteRecipeApi {
  const DeleteRecipeApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<void> execute(int workspaceId, int recipeId) async {
    try {
      await _requester.create().delete<void>('/$workspaceId/recipes/$recipeId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
