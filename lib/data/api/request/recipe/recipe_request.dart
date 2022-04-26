import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_request.freezed.dart';
part 'recipe_request.g.dart';

@freezed
class RecipeRequest with _$RecipeRequest {
  const factory RecipeRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'title') required String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'description') required String description,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'url') required String? url,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image_keys') required List<String> imageKeys,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'tag_ids') required List<int> tagIds,
  }) = _RecipeRequest;

  factory RecipeRequest.fromJson(Map<String, dynamic> json) => _$RecipeRequestFromJson(json);
}
