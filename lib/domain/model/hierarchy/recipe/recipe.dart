import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

@freezed
class Recipe with _$Recipe implements RecipeSummary {
  const factory Recipe({
    required final RecipeId id,
    required final String title,
    required final String description,
    required final Uri? url,
    required final List<Content> images,
    required final List<Tag> tags,
    required final List<DateTime> cookingHistories,
    required final int cookingCount,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _Recipe;

  const Recipe._();

  @override
  Content? get image => images.firstOrNull;

  @override
  DateTime? get lastCookingAt => cookingHistories.firstOrNull;
}
