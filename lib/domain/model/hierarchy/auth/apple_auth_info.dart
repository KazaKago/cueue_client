import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_auth_info.freezed.dart';

@freezed
class AppleAuthInfo with _$AppleAuthInfo {
  const factory AppleAuthInfo({
    required final String idToken,
    required final String accessToken,
    required final String rawNonce,
  }) = _AppleAuthInfo;
}
