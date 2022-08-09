import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';

abstract class CreateWorkspaceUseCase {
  Future<void> call(WorkspaceRegistration workspaceRegistration);
}
