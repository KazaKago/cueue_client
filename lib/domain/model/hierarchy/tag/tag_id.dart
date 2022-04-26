import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_id.freezed.dart';

@freezed
class TagId with _$TagId {
  const factory TagId(int value) = _TagId;
}
