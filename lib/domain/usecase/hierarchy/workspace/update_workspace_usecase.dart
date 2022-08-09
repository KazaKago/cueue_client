import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';

abstract class UpdateWorkspaceUseCase {
  Future<void> call(WorkspaceRegistration workspaceRegistration);
}
