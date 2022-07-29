import 'package:cueue/domain/model/hierarchy/user/apple_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/google_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required UserId id,
    required String displayName,
    required Uri? photoUrl,
    required GoogleProvider? googleProvider,
    required AppleProvider? appleProvider,
    required List<Workspace> workspaces,
  }) = _User;

  const User._();

  bool isGoogleLinked() => googleProvider != null;

  bool isAppleLinked() => appleProvider != null;

  Workspace get currentWorkspace => workspaces.first;
}
