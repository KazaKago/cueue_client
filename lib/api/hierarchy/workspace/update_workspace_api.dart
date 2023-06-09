import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/request/workspace/workspace_request.dart';
import 'package:cueue/api/response/workspace/workspace_response.dart';
import 'package:dio/dio.dart';

class UpdateWorkspaceApi {
  const UpdateWorkspaceApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<WorkspaceResponse> call(WorkspaceRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.put<Map<String, dynamic>>('/users/me/workspace', data: request);
      return WorkspaceResponse.fromJson(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
