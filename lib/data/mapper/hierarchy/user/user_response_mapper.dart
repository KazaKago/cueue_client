import 'package:cueue/data/api/response/user/user_response.dart';
import 'package:cueue/data/auth/hierarchy/apple/apple_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/google/google_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/provider_id.dart';
import 'package:cueue/data/mapper/hierarchy/workspace/workspace_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/user/apple_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/google_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/login_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserResponseMapper {
  const UserResponseMapper(this._workspaceResponseMapper);

  final WorkspaceResponseMapper _workspaceResponseMapper;

  User map(auth.User firebaseUser, UserResponse userResponse) {
    return User(
      id: UserId(userResponse.id),
      displayName: firebaseUser.displayName ?? '',
      photoUrl: (firebaseUser.photoURL != null) ? Uri.parse(firebaseUser.photoURL!) : null,
      googleProvider: _getLoginProvider(firebaseUser, const GoogleProviderId(), (uid, displayName) => GoogleProvider(uid: uid, displayName: displayName)),
      appleProvider: _getLoginProvider(firebaseUser, const AppleProviderId(), (uid, displayName) => AppleProvider(uid: uid, displayName: displayName)),
      workspace: (userResponse.workspace != null) ? _workspaceResponseMapper.map(userResponse.workspace!) : null,
    );
  }

  T? _getLoginProvider<T extends LoginProvider>(auth.User firebaseUser, ProviderId providerId, T Function(String uid, String displayName) transform) {
    final userInfos = firebaseUser.providerData.where((element) => element.providerId == providerId.value).toList();
    if (userInfos.isNotEmpty) {
      final userInfo = userInfos.first;
      return transform(userInfo.uid!, userInfo.displayName ?? userInfo.email ?? '');
    } else {
      return null;
    }
  }
}
