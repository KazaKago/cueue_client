import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/tag/tag_order_request.dart';
import 'package:dio/dio.dart';

class OrderTagApi {
  const OrderTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> execute(int workspaceId, TagOrderRequest request) async {
    try {
      final dio = await _dioCreator.create();
      await dio.patch<void>('/$workspaceId/tags/order', data: request);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
