import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/recipe/recipe_summary_response.dart';
import 'package:dio/dio.dart';

class GetRecipesApi {
  const GetRecipesApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<List<RecipeSummaryResponse>> call({int? afterId, String? keyword, List<int>? tagIds}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (afterId != null) queryParameters.addAll(<String, dynamic>{'after_id': afterId});
      if (keyword != null) queryParameters.addAll(<String, dynamic>{'keyword': keyword});
      if (tagIds != null) queryParameters.addAll(<String, dynamic>{'tag_id': tagIds});
      final dio = await _dioCreator.create();
      final response = await dio.get<List<dynamic>>('/recipes', queryParameters: queryParameters);
      return response.data!.map<RecipeSummaryResponse>((dynamic json) {
        return RecipeSummaryResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
