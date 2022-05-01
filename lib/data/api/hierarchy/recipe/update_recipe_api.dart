import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/recipe/recipe_request.dart';
import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class UpdateRecipeApi {
  const UpdateRecipeApi(this._dio);

  final Dio _dio;

  Future<RecipeResponse> execute(int workspaceId, int recipeId, RecipeRequest request) async {
    try {
      final response = await _dio.patch<Map<String, dynamic>>('/$workspaceId/recipes/$recipeId', data: request);
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
