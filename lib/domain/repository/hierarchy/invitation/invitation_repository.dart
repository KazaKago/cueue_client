import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';

abstract class InvitationRepository {
  Future<Invitation> get(InvitationCode code);

  Future<Invitation> create();

  Future<void> accept(InvitationCode code);
}
