import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_registration.freezed.dart';

@freezed
class WorkspaceRegistration with _$WorkspaceRegistration {
  const factory WorkspaceRegistration({
    required String name,
  }) = _WorkspaceRegistration;
}
