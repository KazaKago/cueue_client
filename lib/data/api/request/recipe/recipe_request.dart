import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_request.freezed.dart';
part 'recipe_request.g.dart';

@freezed
class RecipeRequest with _$RecipeRequest {
  const factory RecipeRequest({
    @JsonKey(name: 'title') required final String title,
    @JsonKey(name: 'description') required final String description,
    @JsonKey(name: 'url') required final String? url,
    @JsonKey(name: 'image_keys') required final List<String> imageKeys,
    @JsonKey(name: 'tag_ids') required final List<int> tagIds,
  }) = _RecipeRequest;

  factory RecipeRequest.fromJson(final Map<String, dynamic> json) => _$RecipeRequestFromJson(json);
}
