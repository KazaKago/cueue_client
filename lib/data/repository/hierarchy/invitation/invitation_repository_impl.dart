import 'package:cueue/data/api/hierarchy/invitation/accept_invitation_api.dart';
import 'package:cueue/data/api/hierarchy/invitation/create_invitation_api.dart';
import 'package:cueue/data/api/hierarchy/invitation/get_invitation_api.dart';
import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/mapper/hierarchy/invitation/invitation_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';

class InvitationRepositoryImpl implements InvitationRepository {
  const InvitationRepositoryImpl(this._getInvitationApi, this._createInvitationApi, this._acceptInvitationApi, this._invitationResponseMapper, this._cacheList);

  final GetInvitationApi _getInvitationApi;
  final CreateInvitationApi _createInvitationApi;
  final AcceptInvitationApi _acceptInvitationApi;
  final InvitationResponseMapper _invitationResponseMapper;
  final List<Cache> _cacheList;

  @override
  Future<Invitation> get(InvitationCode code) async {
    final response = await _getInvitationApi.execute(code.value);
    return _invitationResponseMapper.map(response);
  }

  @override
  Future<Invitation> create() async {
    final response = await _createInvitationApi.execute();
    return _invitationResponseMapper.map(response);
  }

  @override
  Future<void> accept(InvitationCode code) async {
    await _acceptInvitationApi.execute(code.value);
    for (final cache in _cacheList) {
      cache.clearAll();
    }
  }
}
