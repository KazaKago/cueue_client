import 'package:cueue/model/menu/menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_detail_state.freezed.dart';

@freezed
class MenuDetailState with _$MenuDetailState {
  const factory MenuDetailState.loading() = _Loading;

  const factory MenuDetailState.completed(Menu menu) = _Completed;

  const factory MenuDetailState.error(Exception error) = _Error;
}
