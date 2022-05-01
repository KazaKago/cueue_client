import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/recipe/recipe_summary_response.dart';
import 'package:dio/dio.dart';

class GetRecipesApi {
  const GetRecipesApi(this._dio);

  final Dio _dio;

  Future<List<RecipeSummaryResponse>> execute(int workspaceId, {int? afterId, String? keyword, List<int>? tagIds}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (afterId != null) queryParameters.addAll(<String, dynamic>{'after_id': afterId});
      if (keyword != null) queryParameters.addAll(<String, dynamic>{'keyword': keyword});
      if (tagIds != null) queryParameters.addAll(<String, dynamic>{'tag_id': tagIds});
      final response = await _dio.get<List<dynamic>>('/$workspaceId/recipes', queryParameters: queryParameters);
      return response.data!.map<RecipeSummaryResponse>((dynamic json) {
        return RecipeSummaryResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
