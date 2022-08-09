import 'package:cueue/data/api/hierarchy/workspace/create_workspace_api.dart';
import 'package:cueue/data/api/hierarchy/workspace/update_workspace_api.dart';
import 'package:cueue/data/mapper/hierarchy/workspace/workspace_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/workspace/workspace_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace_registration.dart';
import 'package:cueue/domain/repository/hierarchy/workspace/workspace_repository.dart';
import 'package:store_flowable/store_flowable.dart';

class WorkspaceRepositoryImpl implements WorkspaceRepository {
  const WorkspaceRepositoryImpl(this._createWorkspaceApi, this._updateWorkspaceApi, this._userFlowableFactory, this._workspaceResponseMapper, this._workspaceRequestMapper);

  final CreateWorkspaceApi _createWorkspaceApi;
  final UpdateWorkspaceApi _updateWorkspaceApi;
  final UserFlowableFactory _userFlowableFactory;
  final WorkspaceResponseMapper _workspaceResponseMapper;
  final WorkspaceRequestMapper _workspaceRequestMapper;

  @override
  Future<void> create(WorkspaceRegistration workspaceRegistration) async {
    final response = await _createWorkspaceApi.execute(_workspaceRequestMapper.map(workspaceRegistration));

    final userFlowable = _userFlowableFactory.create(null);
    final user = await userFlowable.getData(from: GettingFrom.cache);
    if (user != null) {
      final workspace = _workspaceResponseMapper.map(response);
      final fixedUser = user.copyWith(workspace: workspace);
      await userFlowable.update(fixedUser);
    }
  }

  @override
  Future<void> update(WorkspaceRegistration workspaceRegistration) async {
    final response = await _updateWorkspaceApi.execute(_workspaceRequestMapper.map(workspaceRegistration));

    final userFlowable = _userFlowableFactory.create(null);
    final user = await userFlowable.getData(from: GettingFrom.cache);
    if (user != null) {
      final workspace = _workspaceResponseMapper.map(response);
      final fixedUser = user.copyWith(workspace: workspace);
      await userFlowable.update(fixedUser);
    }
  }
}
