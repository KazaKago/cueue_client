import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_auth_info.freezed.dart';

@freezed
class PasswordAuthInfo with _$PasswordAuthInfo {
  const factory PasswordAuthInfo({
    required Email email,
    required Password password,
  }) = _PasswordAuthInfo;
}
