import 'package:cueue/domain/model/hierarchy/menu/date_split_menu_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState.loading() = _Loading;

  const factory MenuState.loadingWithValue(final List<DateSplitMenuList> menus) = _LoadingWithValue;

  const factory MenuState.completed(final List<DateSplitMenuList> menus) = _Completed;

  const factory MenuState.error(final Exception error) = _Error;

  const factory MenuState.errorWithValue(final List<DateSplitMenuList> menus, final Exception error) = _ErrorWithValue;
}
