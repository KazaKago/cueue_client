import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/recipe/recipe_request.dart';
import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class UpdateRecipeApi {
  const UpdateRecipeApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<RecipeResponse> execute(int workspaceId, int recipeId, RecipeRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.patch<Map<String, dynamic>>('/$workspaceId/recipes/$recipeId', data: request);
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
