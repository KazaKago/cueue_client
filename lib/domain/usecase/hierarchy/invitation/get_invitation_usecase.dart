import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';

abstract class GetInvitationUseCase {
  Future<Invitation> call(InvitationCode code);
}
