import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:dio/dio.dart';

class GetTagsApi {
  const GetTagsApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<List<TagResponse>> execute(int workspaceId) async {
    try {
      final response = await _requester.create().get<List<dynamic>>('/$workspaceId/tags');
      return response.data!.map<TagResponse>((dynamic json) {
        return TagResponse.fromJson(json as Map<String, dynamic>);
      }).toList();
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
