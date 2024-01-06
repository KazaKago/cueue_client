import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class GetTagApi {
  const GetTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<TagResponse> call({required int tagId}) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<Map<String, dynamic>>('/tags/$tagId');
      return TagResponse.fromJson(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
