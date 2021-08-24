import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_request.freezed.dart';
part 'tag_request.g.dart';

@freezed
class TagRequest with _$TagRequest {
  const factory TagRequest({
    @JsonKey(name: 'name') required final String name,
  }) = _TagRequest;

  factory TagRequest.fromJson(final Map<String, dynamic> json) => _$TagRequestFromJson(json);
}
