import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/request/tag/tag_order_request.dart';
import 'package:cueue/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class OrderTagApi {
  const OrderTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<List<TagResponse>> call(TagOrderRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.patch<List<dynamic>>('/tags/order', data: request);
      return response.data!.map<TagResponse>((dynamic json) {
        return TagResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
