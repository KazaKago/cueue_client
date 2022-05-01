import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteRecipeApi {
  const DeleteRecipeApi(this._dio);

  final Dio _dio;

  Future<void> execute(int workspaceId, int recipeId) async {
    try {
      await _dio.delete<void>('/$workspaceId/recipes/$recipeId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
