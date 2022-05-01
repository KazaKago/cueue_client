import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _Loading;

  const factory SearchState.completed(List<Tag> tags) = _Completed;

  const factory SearchState.error(Exception error) = _Error;
}
