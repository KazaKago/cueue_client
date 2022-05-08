import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/tag/tag_order_request.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class OrderTagApi {
  const OrderTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<List<TagResponse>> execute(int workspaceId, TagOrderRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.patch<List<dynamic>>('/$workspaceId/tags/order', data: request);
      return response.data!.map<TagResponse>((dynamic json) {
        return TagResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
