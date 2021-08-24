import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/menu/menu_summary_response.dart';
import 'package:dio/dio.dart';

class GetMenusApi {
  const GetMenusApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<List<MenuSummaryResponse>> execute({final int? afterId}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (afterId != null) queryParameters.addAll(<String, dynamic>{'after_id': afterId});
      final response = await _requester.create().get<List<dynamic>>('/menus', queryParameters: queryParameters);
      return response.data!.map<MenuSummaryResponse>((dynamic json) {
        return MenuSummaryResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
