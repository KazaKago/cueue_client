import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';

@freezed
class Menu with _$Menu implements MenuSummary {
  const factory Menu({
    required MenuId id,
    required String memo,
    required DateTime date,
    required TimeFrame timeFrame,
    required List<RecipeSummary> recipes,
  }) = _Menu;
}
