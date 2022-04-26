import 'package:cueue/data/api/response/content/content_response.dart';
import 'package:cueue/data/api/response/tag/tag_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_response.freezed.dart';
part 'recipe_response.g.dart';

@freezed
class RecipeResponse with _$RecipeResponse {
  const factory RecipeResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'title') required String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'description') required String description,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'url') required String? url,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'images') required List<ContentResponse> images,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'tags') required List<TagResponse> tags,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'cooking_histories') required List<String> cookingHistories,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'cooking_count') required int cookingCount,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'created_at') required String createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _RecipeResponse;

  factory RecipeResponse.fromJson(Map<String, dynamic> json) => _$RecipeResponseFromJson(json);
}
