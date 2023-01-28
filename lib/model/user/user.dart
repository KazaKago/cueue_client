import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/user/apple_provider.dart';
import 'package:cueue/model/user/google_provider.dart';
import 'package:cueue/model/user/user_id.dart';
import 'package:cueue/model/workspace/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required UserId id,
    required String displayName,
    required Content? photo,
    required GoogleProvider? googleProvider,
    required AppleProvider? appleProvider,
    required Workspace? workspace,
  }) = _User;

  const User._();

  bool isGoogleLinked() => googleProvider != null;

  bool isAppleLinked() => appleProvider != null;

  Workspace requireWorkspace() {
    return (workspace != null) ? workspace! : throw StateError('No element');
  }
}
