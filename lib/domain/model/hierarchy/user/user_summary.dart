import 'package:cueue/domain/model/hierarchy/user/apple_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/google_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary.freezed.dart';

@freezed
class UserSummary with _$UserSummary {
  const factory UserSummary({
    required UserId id,
  }) = _UserSummary;
}
