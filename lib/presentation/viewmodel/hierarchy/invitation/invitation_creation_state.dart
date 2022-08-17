import 'package:cueue/domain/model/hierarchy/invitation/invitation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_creation_state.freezed.dart';

@freezed
class InvitationCreationState with _$InvitationCreationState {
  const factory InvitationCreationState.loading() = _Loading;

  const factory InvitationCreationState.completed(Invitation invitation) = _Completed;

  const factory InvitationCreationState.error(Exception error) = _Error;
}
