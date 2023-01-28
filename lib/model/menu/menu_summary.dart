import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';

abstract class MenuSummary {
  MenuSummary(this.id, this.memo, this.date, this.timeFrame, this.recipes);

  final MenuId id;
  final String memo;
  final DateTime date;
  final TimeFrame timeFrame;
  final List<RecipeSummary> recipes;
}
