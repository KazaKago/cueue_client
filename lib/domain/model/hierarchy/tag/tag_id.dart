import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_id.freezed.dart';

@freezed
class TagId with _$TagId implements Comparable<TagId> {
  const factory TagId(int value) = _TagId;

  const TagId._();

  @override
  int compareTo(TagId other) {
    if (value < other.value) return -1;
    if (value > other.value) return 1;
    return 0;
  }
}
