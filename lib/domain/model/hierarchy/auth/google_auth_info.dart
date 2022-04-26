import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_auth_info.freezed.dart';

@freezed
class GoogleAuthInfo with _$GoogleAuthInfo {
  const factory GoogleAuthInfo({
    required String accessToken,
    required String idToken,
  }) = _GoogleAuthInfo;
}
