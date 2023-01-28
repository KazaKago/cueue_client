import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class GetRecipeApi {
  const GetRecipeApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<RecipeResponse> call({required int recipeId}) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<Map<String, dynamic>>('/recipes/$recipeId');
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
