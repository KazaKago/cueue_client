import 'package:cueue/api/hierarchy/workspace/create_workspace_api.dart';
import 'package:cueue/api/request/workspace/workspace_request.dart';
import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/api/response/user/user_summary_response.dart';
import 'package:cueue/api/response/workspace/workspace_response.dart';
import 'package:cueue/gen/assets.gen.dart';

class FakeCreateWorkspaceApi implements CreateWorkspaceApi {
  const FakeCreateWorkspaceApi();

  @override
  Future<WorkspaceResponse> call(WorkspaceRequest request) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return WorkspaceResponse(
      id: 0,
      name: 'workspace name',
      users: [
        UserSummaryResponse(
          id: 0,
          displayName: 'display name',
          photo: ContentResponse(
            key: 'key',
            url: Assets.images.time1Asa.path,
          ),
        ),
      ],
    );
  }
}
