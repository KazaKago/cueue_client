import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'message') required String message,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}
