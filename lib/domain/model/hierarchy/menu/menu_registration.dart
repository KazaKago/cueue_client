import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_registration.freezed.dart';

@freezed
class MenuRegistration with _$MenuRegistration {
  const factory MenuRegistration({
    required String memo,
    required DateTime date,
    required TimeFrame timeFrame,
    required List<RecipeId> recipeIds,
  }) = _MenuRegistration;
}
