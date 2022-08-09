import 'package:cueue/data/api/response/workspace/workspace_response.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_summary_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace_id.dart';

class WorkspaceResponseMapper {
  const WorkspaceResponseMapper(this._userSummaryResponseMapper);

  final UserSummaryResponseMapper _userSummaryResponseMapper;

  Workspace map(WorkspaceResponse response) {
    return Workspace(
      id: WorkspaceId(response.id),
      name: response.name,
      users: response.users.map(_userSummaryResponseMapper.map).toList(),
    );
  }
}
