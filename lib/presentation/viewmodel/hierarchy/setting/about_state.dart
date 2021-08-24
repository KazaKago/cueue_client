import 'package:cueue/domain/model/hierarchy/info/app_info.dart';
import 'package:cueue/domain/model/hierarchy/info/developer_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_state.freezed.dart';

@freezed
class AboutState with _$AboutState {
  const factory AboutState.loading() = _Loading;

  const factory AboutState.completed(final AppInfo appInfo, final DeveloperInfo developerInfo) = _Completed;
}
