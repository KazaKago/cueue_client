import 'package:cueue/data/api/response/recipe/recipe_summary_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
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
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, dynamic> json) => _$MenuResponseFromJson(json);
}
