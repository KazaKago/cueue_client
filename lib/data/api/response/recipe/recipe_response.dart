import 'package:cueue/data/api/response/content/content_response.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_response.freezed.dart';
part 'recipe_response.g.dart';

@freezed
class RecipeResponse with _$RecipeResponse {
  const factory RecipeResponse({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'title') required final String title,
    @JsonKey(name: 'description') required final String description,
    @JsonKey(name: 'url') required final String? url,
    @JsonKey(name: 'images') required final List<ContentResponse> images,
    @JsonKey(name: 'tags') required final List<TagResponse> tags,
    @JsonKey(name: 'cooking_histories') required final List<String> cookingHistories,
    @JsonKey(name: 'cooking_count') required final int cookingCount,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
  }) = _RecipeResponse;

  factory RecipeResponse.fromJson(final Map<String, dynamic> json) => _$RecipeResponseFromJson(json);
}
