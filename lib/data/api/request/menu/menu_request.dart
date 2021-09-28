import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_request.freezed.dart';
part 'menu_request.g.dart';

@freezed
class MenuRequest with _$MenuRequest {
  const factory MenuRequest({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'memo') required final String memo,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'date') required final String date,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'time_frame') required final String timeFrame,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'recipe_ids') required final List<int> recipeIds,
  }) = _MenuRequest;

  factory MenuRequest.fromJson(final Map<String, dynamic> json) => _$MenuRequestFromJson(json);
}
