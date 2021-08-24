import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/recipe/recipe_request.dart';
import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class UpdateRecipeApi {
  const UpdateRecipeApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<RecipeResponse> execute(final int recipeId, final RecipeRequest request) async {
    try {
      final response = await _requester.create().patch<Map<String, dynamic>>('/recipes/$recipeId', data: request);
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
