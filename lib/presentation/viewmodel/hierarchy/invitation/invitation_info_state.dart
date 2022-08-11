import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_info_state.freezed.dart';

@freezed
class InvitationInfoState with _$InvitationInfoState {
  const factory InvitationInfoState.loading() = _Loading;

  const factory InvitationInfoState.completed(Invitation invitation) = _Completed;

  const factory InvitationInfoState.error(Exception error) = _Error;
}
