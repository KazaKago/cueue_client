import 'package:cueue/data/api/hierarchy/workspace/create_workspace_api.dart';
import 'package:cueue/data/api/request/workspace/workspace_request.dart';
import 'package:cueue/data/mapper/hierarchy/workspace/workspace_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/repository/hierarchy/workspace/workspace_repository.dart';
import 'package:store_flowable/store_flowable.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  const WorkspaceRepositoryImpl(this._createWorkspaceApi, this._userFlowableFactory, this._workspaceResponseMapper);

  final CreateWorkspaceApi _createWorkspaceApi;
  final UserFlowableFactory _userFlowableFactory;
  final WorkspaceResponseMapper _workspaceResponseMapper;

  @override
  Future<void> create(String name) async {
    final response = await _createWorkspaceApi.execute(WorkspaceRequest(name: name));

    final userFlowable = _userFlowableFactory.create(null);
    final user = await userFlowable.getData(from: GettingFrom.cache);
    if (user != null) {
      final workspace = _workspaceResponseMapper.map(response);
      final fixedUser = user.copyWith(workspace: workspace);
      await userFlowable.update(fixedUser);
    }
  }
}
