import 'package:cueue/data/api/response/recipe/recipe_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'memo') required final String memo,
    @JsonKey(name: 'date') required final String date,
    @JsonKey(name: 'time_frame') required final String timeFrame,
    @JsonKey(name: 'recipes') required final List<RecipeSummaryResponse> recipes,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(final Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}
