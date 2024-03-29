import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_key.freezed.dart';

@freezed
class ContentKey with _$ContentKey {
  const factory ContentKey(String value) = _ContentKey;
}
