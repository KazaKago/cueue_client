import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/user/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary.freezed.dart';

@freezed
class UserSummary with _$UserSummary {
  const factory UserSummary({
    required UserId id,
    required String displayName,
    required Content? photo,
  }) = _UserSummary;
}
