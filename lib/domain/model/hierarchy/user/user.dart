import 'package:cueue/domain/model/hierarchy/user/apple_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/google_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/password_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:cueue/domain/model/hierarchy/workspace/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required final UserId id,
    required final Email email,
    required final bool isEmailVerified,
    required final PasswordProvider? passwordProvider,
    required final GoogleProvider? googleProvider,
    required final AppleProvider? appleProvider,
    required final List<Workspace> workspaces,
  }) = _User;

  const User._();

  bool isPasswordLinked() => passwordProvider != null;

  bool isGoogleLinked() => googleProvider != null;

  bool isAppleLinked() => appleProvider != null;

  Workspace get currentWorkspace => workspaces.first;
}
