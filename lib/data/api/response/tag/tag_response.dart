import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_response.freezed.dart';
part 'tag_response.g.dart';

@freezed
class TagResponse with _$TagResponse {
  const factory TagResponse({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'name') required final String name,
  }) = _TagResponse;

  factory TagResponse.fromJson(final Map<String, dynamic> json) => _$TagResponseFromJson(json);
}
