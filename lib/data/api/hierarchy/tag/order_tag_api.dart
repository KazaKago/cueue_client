import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/tag/tag_order_request.dart';
import 'package:dio/dio.dart';

class OrderTagApi {
  const OrderTagApi(this._dio);

  final Dio _dio;

  Future<void> execute(int workspaceId, TagOrderRequest request) async {
    try {
      await _dio.patch<void>('/$workspaceId/tags/order', data: request);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
