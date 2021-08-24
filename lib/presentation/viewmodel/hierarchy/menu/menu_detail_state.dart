import 'package:cueue/domain/model/hierarchy/menu/menu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_detail_state.freezed.dart';

@freezed
class MenuDetailState with _$MenuDetailState {
  const factory MenuDetailState.loading() = _Loading;

  const factory MenuDetailState.completed(final Menu menu) = _Completed;

  const factory MenuDetailState.error(final Exception error) = _Error;
}
