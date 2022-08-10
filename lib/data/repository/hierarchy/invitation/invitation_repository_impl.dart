import 'package:cueue/data/api/hierarchy/invitation/accept_invitation_api.dart';
import 'package:cueue/data/api/hierarchy/invitation/create_invitation_api.dart';
import 'package:cueue/data/api/hierarchy/invitation/get_invitation_api.dart';
import 'package:cueue/data/mapper/hierarchy/invitation/invitation_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';
import 'package:cueue/domain/repository/hierarchy/invitation/invitation_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_flowable/store_flowable.dart';

class InvitationRepositoryImpl implements InvitationRepository {
  const InvitationRepositoryImpl(this._getInvitationApi, this._createInvitationApi, this._acceptInvitationApi, this._invitationResponseMapper, this._userResponseMapper, this._userFlowableFactory);

  final GetInvitationApi _getInvitationApi;
  final CreateInvitationApi _createInvitationApi;
  final AcceptInvitationApi _acceptInvitationApi;
  final InvitationResponseMapper _invitationResponseMapper;
  final UserResponseMapper _userResponseMapper;
  final UserFlowableFactory _userFlowableFactory;

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
    final response = await _acceptInvitationApi.execute(code.value);
    final user = _userResponseMapper.map(FirebaseAuth.instance.currentUser!, response);

    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.update(user);
  }
}
