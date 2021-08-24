import 'package:cueue/data/api/response/recipe/recipe_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_summary_response.freezed.dart';
part 'menu_summary_response.g.dart';

@freezed
class MenuSummaryResponse with _$MenuSummaryResponse {
  const factory MenuSummaryResponse({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'memo') required final String memo,
    @JsonKey(name: 'date') required final String date,
    @JsonKey(name: 'time_frame') required final String timeFrame,
    @JsonKey(name: 'recipes') required final List<RecipeSummaryResponse> recipes,
  }) = _MenuSummaryResponse;

  factory MenuSummaryResponse.fromJson(final Map<String, dynamic> json) => _$MenuSummaryResponseFromJson(json);
}
