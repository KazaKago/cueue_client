import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteRecipeApi {
  const DeleteRecipeApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> execute(int recipeId) async {
    try {
      final dio = await _dioCreator.create();
      await dio.delete<void>('/recipes/$recipeId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
