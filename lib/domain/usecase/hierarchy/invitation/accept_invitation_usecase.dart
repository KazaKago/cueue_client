import 'package:cueue/domain/model/hierarchy/invitation/invitation_code.dart';

abstract class AcceptInvitationUseCase {
  Future<void> call(InvitationCode code);
}
