import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class GetRecipeApi {
  const GetRecipeApi(this._dio);

  final Dio _dio;

  Future<RecipeResponse> execute(int workspaceId, {required int recipeId}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/$workspaceId/recipes/$recipeId');
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
