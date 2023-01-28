import 'package:cueue/api/response/recipe/recipe_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_summary_response.freezed.dart';
part 'menu_summary_response.g.dart';

@freezed
class MenuSummaryResponse with _$MenuSummaryResponse {
  const factory MenuSummaryResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'memo') required String memo,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'date') required String date,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'time_frame') required String timeFrame,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'recipes') required List<RecipeSummaryResponse> recipes,
  }) = _MenuSummaryResponse;

  factory MenuSummaryResponse.fromJson(Map<String, dynamic> json) => _$MenuSummaryResponseFromJson(json);
}
