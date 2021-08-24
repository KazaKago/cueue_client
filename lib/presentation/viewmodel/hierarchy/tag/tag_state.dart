import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_state.freezed.dart';

@freezed
class TagState with _$TagState {
  const factory TagState.loading() = _Loading;

  const factory TagState.completed(final List<Tag> tags) = _Completed;

  const factory TagState.error(final Exception error) = _Error;
}
