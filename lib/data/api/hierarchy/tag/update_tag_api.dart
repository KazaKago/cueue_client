import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/tag/tag_request.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class UpdateTagApi {
  const UpdateTagApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<TagResponse> execute(final int tagId, final TagRequest request) async {
    try {
      final response = await _requester.create().patch<Map<String, dynamic>>('/tags/$tagId', data: request);
      return TagResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
