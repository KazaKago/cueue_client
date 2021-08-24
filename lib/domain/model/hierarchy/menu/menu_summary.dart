import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';

abstract class MenuSummary {
  MenuSummary(this.id, this.memo, this.date, this.timeFrame, this.recipes);

  final MenuId id;
  final String memo;
  final DateTime date;
  final TimeFrame timeFrame;
  final List<RecipeSummary> recipes;
}
