import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/model/workspace/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation.freezed.dart';

@freezed
class Invitation with _$Invitation {
  const factory Invitation({
    required InvitationCode code,
    required Workspace workspace,
    required DateTime expiredAt,
  }) = _Invitation;
}
