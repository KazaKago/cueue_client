import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/request/workspace/workspace_request.dart';
import 'package:cueue/data/api/response/workspace/workspace_response.dart';
import 'package:dio/dio.dart';

class CreateWorkspaceApi {
  const CreateWorkspaceApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<WorkspaceResponse> execute(WorkspaceRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.post<Map<String, dynamic>>('/users/me/workspace', data: request);
      return WorkspaceResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
