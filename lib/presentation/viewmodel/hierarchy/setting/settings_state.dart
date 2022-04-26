import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = _Loading;

  const factory SettingsState.completed(User user) = _Completed;

  const factory SettingsState.error(Exception error) = _Error;
}
