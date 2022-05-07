import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteRecipeApi {
  const DeleteRecipeApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> execute(int workspaceId, int recipeId) async {
    try {
      final dio = await _dioCreator.create();
      await dio.delete<void>('/$workspaceId/recipes/$recipeId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
