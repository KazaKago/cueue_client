import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_request.freezed.dart';
part 'menu_request.g.dart';

@freezed
class MenuRequest with _$MenuRequest {
  const factory MenuRequest({
    @JsonKey(name: 'memo') required final String memo,
    @JsonKey(name: 'date') required final String date,
    @JsonKey(name: 'time_frame') required final String timeFrame,
    @JsonKey(name: 'recipe_ids') required final List<int> recipeIds,
  }) = _MenuRequest;

  factory MenuRequest.fromJson(final Map<String, dynamic> json) => _$MenuRequestFromJson(json);
}
