import 'package:collection/collection.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe implements RecipeSummary {
  const factory Recipe({
    required RecipeId id,
    required String title,
    required String description,
    required Uri? url,
    required List<Content> images,
    required List<Tag> tags,
    required List<DateTime> cookingHistories,
    required int cookingCount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Recipe;

  const Recipe._();

  @override
  Content? get image => images.firstOrNull;

  @override
  DateTime? get lastCookingAt => cookingHistories.firstOrNull;
}
