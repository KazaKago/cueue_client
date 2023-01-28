import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/menu/menu_summary_response.dart';
import 'package:dio/dio.dart';

class GetMenusApi {
  const GetMenusApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<List<MenuSummaryResponse>> call({int? afterId}) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (afterId != null) queryParameters.addAll(<String, dynamic>{'after_id': afterId});
      final dio = await _dioCreator.create();
      final response = await dio.get<List<dynamic>>('/menus', queryParameters: queryParameters);
      return response.data!.map<MenuSummaryResponse>((dynamic json) {
        return MenuSummaryResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
