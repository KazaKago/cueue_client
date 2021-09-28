import 'package:cueue/data/api/response/recipe/recipe_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required final int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'memo') required final String memo,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'date') required final String date,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'time_frame') required final String timeFrame,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'recipes') required final List<RecipeSummaryResponse> recipes,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(final Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}
