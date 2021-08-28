import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:dio/dio.dart';

class GetRecipeApi {
  const GetRecipeApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<RecipeResponse> execute(final int workspaceId, {required final int recipeId}) async {
    try {
      final response = await _requester.create().get<Map<String, dynamic>>('/$workspaceId/recipes/$recipeId');
      return RecipeResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
