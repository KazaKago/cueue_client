import 'package:cueue/data/api/response/workspace/workspace_response.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace_id.dart';

class WorkspaceResponseMapper {
  const WorkspaceResponseMapper();

  Workspace map(WorkspaceResponse response) {
    return Workspace(
      id: WorkspaceId(response.id),
      name: response.name,
    );
  }
}
