import 'package:cueue/data/api/response/content/content_response.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_response.freezed.dart';
part 'recipe_response.g.dart';

@freezed
class RecipeResponse with _$RecipeResponse {
  const factory RecipeResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required final int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'title') required final String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'description') required final String description,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'url') required final String? url,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'images') required final List<ContentResponse> images,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'tags') required final List<TagResponse> tags,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'cooking_histories') required final List<String> cookingHistories,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'cooking_count') required final int cookingCount,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'created_at') required final String createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _RecipeResponse;

  factory RecipeResponse.fromJson(final Map<String, dynamic> json) => _$RecipeResponseFromJson(json);
}
