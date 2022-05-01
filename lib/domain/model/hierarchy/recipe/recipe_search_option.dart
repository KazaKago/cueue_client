import 'package:collection/collection.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_search_option.freezed.dart';

@freezed
class RecipeSearchOption with _$RecipeSearchOption {
  factory RecipeSearchOption({
    String? keyword,
    List<TagId>? tagIds,
  }) {
    final sortedTagIds = tagIds?.sorted();
    return RecipeSearchOption._(keyword: keyword, tagIds: sortedTagIds);
  }

  const factory RecipeSearchOption._({
    String? keyword,
    List<TagId>? tagIds,
  }) = _RecipeSearchOption;
}
