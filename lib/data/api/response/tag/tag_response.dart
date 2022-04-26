import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_response.freezed.dart';
part 'tag_response.g.dart';

@freezed
class TagResponse with _$TagResponse {
  const factory TagResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'name') required String name,
  }) = _TagResponse;

  factory TagResponse.fromJson(Map<String, dynamic> json) => _$TagResponseFromJson(json);
}
