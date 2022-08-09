import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request.freezed.dart';
part 'user_request.g.dart';

@freezed
class UserRequest with _$UserRequest {
  const factory UserRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'display_name') required String displayName,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'photo_key') required String? photoKey,
  }) = _UserRequest;

  factory UserRequest.fromJson(Map<String, dynamic> json) => _$UserRequestFromJson(json);
}
