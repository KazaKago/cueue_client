import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

@freezed
class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'message') required final String message,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(final Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}
