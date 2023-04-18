import 'package:cueue/api/hierarchy/invitation/create_invitation_api.dart';
import 'package:cueue/api/response/content/content_response.dart';
import 'package:cueue/api/response/invitation/invitation_response.dart';
import 'package:cueue/api/response/user/user_summary_response.dart';
import 'package:cueue/api/response/workspace/workspace_response.dart';
import 'package:cueue/gen/assets.gen.dart';

class FakeCreateInvitationApi implements CreateInvitationApi {
  const FakeCreateInvitationApi();

  @override
  Future<InvitationResponse> call() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return InvitationResponse(
      code: '12345',
      expiredAt: '2012-02-27 13:27:00',
      workspace: WorkspaceResponse(
        id: 0,
        name: 'workspace name',
        users: [
          UserSummaryResponse(
            id: 0,
            displayName: 'display name 1',
            photo: ContentResponse(
              key: 'key 1',
              url: Assets.images.time1Asa.path,
            ),
          ),
          UserSummaryResponse(
            id: 1,
            displayName: 'display name 2',
            photo: ContentResponse(
              key: 'key 2',
              url: Assets.images.time2Hiru.path,
            ),
          ),
        ],
      ),
    );
  }
}
