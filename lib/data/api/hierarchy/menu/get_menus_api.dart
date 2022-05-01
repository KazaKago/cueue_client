import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/menu/menu_summary_response.dart';
import 'package:dio/dio.dart';

class GetMenusApi {
  const GetMenusApi(this._dio);

  final Dio _dio;

  Future<List<MenuSummaryResponse>> execute(int workspaceId, {int? afterId}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (afterId != null) queryParameters.addAll(<String, dynamic>{'after_id': afterId});
      final response = await _dio.get<List<dynamic>>('/$workspaceId/menus', queryParameters: queryParameters);
      return response.data!.map<MenuSummaryResponse>((dynamic json) {
        return MenuSummaryResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
