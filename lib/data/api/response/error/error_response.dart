import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required final String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'message') required final String message,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(final Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}
