import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required final TagId id,
    required final String name,
  }) = _Tag;
}
