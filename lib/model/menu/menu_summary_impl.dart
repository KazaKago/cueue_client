import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/model/menu/time_frame.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_summary_impl.freezed.dart';

@freezed
class MenuSummaryImpl with _$MenuSummaryImpl implements MenuSummary {
  const factory MenuSummaryImpl({
    required MenuId id,
    required String memo,
    required DateTime date,
    required TimeFrame timeFrame,
    required List<RecipeSummary> recipes,
  }) = _MenuSummaryImpl;
}
