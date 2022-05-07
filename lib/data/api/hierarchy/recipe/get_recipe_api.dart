import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class GetRecipeApi {
  const GetRecipeApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<RecipeResponse> execute(int workspaceId, {required int recipeId}) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<Map<String, dynamic>>('/$workspaceId/recipes/$recipeId');
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
