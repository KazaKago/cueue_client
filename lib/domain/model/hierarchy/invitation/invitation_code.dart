import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_code.freezed.dart';

@freezed
class InvitationCode with _$InvitationCode {
  const factory InvitationCode(String value) = _InvitationCode;
}
