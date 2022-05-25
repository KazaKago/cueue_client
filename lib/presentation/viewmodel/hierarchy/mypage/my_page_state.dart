import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState.loading() = _Loading;

  const factory MyPageState.completed(User user) = _Completed;

  const factory MyPageState.error(Exception error) = _Error;
}
