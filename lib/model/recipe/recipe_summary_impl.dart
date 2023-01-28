import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_summary_impl.freezed.dart';

@freezed
class RecipeSummaryImpl with _$RecipeSummaryImpl implements RecipeSummary {
  const factory RecipeSummaryImpl({
    required RecipeId id,
    required String title,
    required Content? image,
    required DateTime? lastCookingAt,
  }) = _RecipeSummaryImpl;
}
