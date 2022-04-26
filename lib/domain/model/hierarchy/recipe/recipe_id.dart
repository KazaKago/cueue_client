import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_id.freezed.dart';

@freezed
class RecipeId with _$RecipeId {
  const factory RecipeId(int value) = _RecipeId;
}
