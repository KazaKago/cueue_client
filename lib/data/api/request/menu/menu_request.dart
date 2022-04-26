import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_request.freezed.dart';
part 'menu_request.g.dart';

@freezed
class MenuRequest with _$MenuRequest {
  const factory MenuRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'memo') required String memo,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'date') required String date,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'time_frame') required String timeFrame,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'recipe_ids') required List<int> recipeIds,
  }) = _MenuRequest;

  factory MenuRequest.fromJson(Map<String, dynamic> json) => _$MenuRequestFromJson(json);
}
