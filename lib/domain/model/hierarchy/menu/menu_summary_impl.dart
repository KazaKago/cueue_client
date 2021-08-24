import 'package:cueue/domain/model/hierarchy/menu/menu_id.dart';
import 'package:cueue/domain/model/hierarchy/menu/menu_summary.dart';
import 'package:cueue/domain/model/hierarchy/menu/time_frame.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_summary_impl.freezed.dart';

@freezed
class MenuSummaryImpl with _$MenuSummaryImpl implements MenuSummary {
  const factory MenuSummaryImpl({
    required final MenuId id,
    required final String memo,
    required final DateTime date,
    required final TimeFrame timeFrame,
    required final List<RecipeSummary> recipes,
  }) = _MenuSummaryImpl;
}
