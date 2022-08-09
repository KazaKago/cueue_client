import 'package:cueue/domain/model/hierarchy/content/content_key.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_registration.freezed.dart';

@freezed
class UserRegistration with _$UserRegistration {
  const factory UserRegistration({
    required String displayName,
    required ContentKey? photoKey,
  }) = _UserRegistration;
}
