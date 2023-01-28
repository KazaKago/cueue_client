import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/request/recipe/recipe_request.dart';
import 'package:cueue/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class UpdateRecipeApi {
  const UpdateRecipeApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<RecipeResponse> call(int recipeId, RecipeRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.put<Map<String, dynamic>>('/recipes/$recipeId', data: request);
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
