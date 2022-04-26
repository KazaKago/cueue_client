import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_auth_info.freezed.dart';

@freezed
class AppleAuthInfo with _$AppleAuthInfo {
  const factory AppleAuthInfo({
    required String idToken,
    required String accessToken,
    required String rawNonce,
  }) = _AppleAuthInfo;
}
