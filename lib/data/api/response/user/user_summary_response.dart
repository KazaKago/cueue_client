import 'package:cueue/data/api/response/workspace/workspace_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary_response.freezed.dart';

part 'user_summary_response.g.dart';

@freezed
class UserSummaryResponse with _$UserSummaryResponse {
  const factory UserSummaryResponse({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'id') required int id,
  }) = _UserSummaryResponse;

  factory UserSummaryResponse.fromJson(Map<String, dynamic> json) => _$UserSummaryResponseFromJson(json);
}
