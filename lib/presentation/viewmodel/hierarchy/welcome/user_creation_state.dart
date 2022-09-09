import 'package:cueue/domain/model/hierarchy/user/pre_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_creation_state.freezed.dart';

@freezed
class UserCreationState with _$UserCreationState {
  const factory UserCreationState.loading() = _Loading;

  const factory UserCreationState.completed(PreUser user) = _Completed;

  const factory UserCreationState.error(Exception error) = _Error;
}
