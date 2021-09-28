import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_request.freezed.dart';
part 'recipe_request.g.dart';

@freezed
class RecipeRequest with _$RecipeRequest {
  const factory RecipeRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'title') required final String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'description') required final String description,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'url') required final String? url,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image_keys') required final List<String> imageKeys,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'tag_ids') required final List<int> tagIds,
  }) = _RecipeRequest;

  factory RecipeRequest.fromJson(final Map<String, dynamic> json) => _$RecipeRequestFromJson(json);
}
