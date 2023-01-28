import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class GetTagsApi {
  const GetTagsApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<List<TagResponse>> call() async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<List<dynamic>>('/tags');
      return response.data!.map<TagResponse>((dynamic json) {
        return TagResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
