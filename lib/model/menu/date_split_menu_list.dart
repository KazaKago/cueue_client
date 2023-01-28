import 'package:cueue/model/menu/menu_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_split_menu_list.freezed.dart';

@freezed
class DateSplitMenuList with _$DateSplitMenuList {
  const factory DateSplitMenuList({
    required DateTime date,
    required List<MenuSummary> menus,
  }) = _DateSplitMenuList;
}
