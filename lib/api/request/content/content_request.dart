import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_request.freezed.dart';
part 'content_request.g.dart';

@freezed
class ContentRequest with _$ContentRequest {
  const factory ContentRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'data') required String data,
  }) = _ContentRequest;

  factory ContentRequest.fromJson(Map<String, dynamic> json) => _$ContentRequestFromJson(json);
}
