import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_response.freezed.dart';
part 'content_response.g.dart';

@freezed
class ContentResponse with _$ContentResponse {
  const factory ContentResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'key') required final String key,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'url') required final String url,
  }) = _ContentResponse;

  factory ContentResponse.fromJson(final Map<String, dynamic> json) => _$ContentResponseFromJson(json);
}
