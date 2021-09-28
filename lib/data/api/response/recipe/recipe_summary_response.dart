import 'package:cueue/data/api/response/content/content_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_summary_response.freezed.dart';
part 'recipe_summary_response.g.dart';

@freezed
class RecipeSummaryResponse with _$RecipeSummaryResponse {
  const factory RecipeSummaryResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required final int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'title') required final String title,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'image') required final ContentResponse? image,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'last_cooking_at') required final String? lastCookingAt,
  }) = _RecipeSummaryResponse;

  factory RecipeSummaryResponse.fromJson(final Map<String, dynamic> json) => _$RecipeSummaryResponseFromJson(json);
}
