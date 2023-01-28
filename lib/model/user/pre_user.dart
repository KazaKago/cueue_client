import 'package:cueue/model/content/content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pre_user.freezed.dart';

@freezed
class PreUser with _$PreUser {
  const factory PreUser({
    required String displayName,
    required Content? photo,
  }) = _PreUser;
}
