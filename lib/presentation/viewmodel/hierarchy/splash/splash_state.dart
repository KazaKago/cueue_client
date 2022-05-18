import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.loading() = _Loading;

  const factory SplashState.error(Exception exception) = _Error;
}
