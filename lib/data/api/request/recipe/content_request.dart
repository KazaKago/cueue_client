import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_request.freezed.dart';
part 'content_request.g.dart';

@freezed
class ContentRequest with _$ContentRequest {
  const factory ContentRequest({
    @JsonKey(name: 'data') required final String data,
  }) = _ContentRequest;

  factory ContentRequest.fromJson(final Map<String, dynamic> json) => _$ContentRequestFromJson(json);
}
