import 'package:cueue/api/response/content/content_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_summary_response.freezed.dart';
part 'recipe_summary_response.g.dart';

@freezed
class RecipeSummaryResponse with _$RecipeSummaryResponse {
  const factory RecipeSummaryResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'title') required String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image') required ContentResponse? image,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_cooking_at') required String? lastCookingAt,
  }) = _RecipeSummaryResponse;

  factory RecipeSummaryResponse.fromJson(Map<String, dynamic> json) => _$RecipeSummaryResponseFromJson(json);
}
