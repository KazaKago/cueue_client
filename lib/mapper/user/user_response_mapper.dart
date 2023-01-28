import 'package:cueue/api/response/user/user_response.dart';
import 'package:cueue/mapper/content/content_response_mapper.dart';
import 'package:cueue/mapper/workspace/workspace_response_mapper.dart';
import 'package:cueue/model/auth/apple_provider_id.dart';
import 'package:cueue/model/auth/firebase_user.dart';
import 'package:cueue/model/auth/google_provider_id.dart';
import 'package:cueue/model/auth/provider_id.dart';
import 'package:cueue/model/user/apple_provider.dart';
import 'package:cueue/model/user/google_provider.dart';
import 'package:cueue/model/user/login_provider.dart';
import 'package:cueue/model/user/user.dart';
import 'package:cueue/model/user/user_id.dart';

class UserResponseMapper {
  const UserResponseMapper(this._workspaceResponseMapper, this._contentResponseMapper);

  final WorkspaceResponseMapper _workspaceResponseMapper;
  final ContentResponseMapper _contentResponseMapper;

  User call(FirebaseUser firebaseUser, UserResponse userResponse) {
    return User(
      id: UserId(userResponse.id),
      displayName: userResponse.displayName,
      photo: userResponse.photo != null ? _contentResponseMapper(userResponse.photo!) : null,
      googleProvider: _getLoginProvider(firebaseUser, const GoogleProviderId(), (uid, email, displayName) => GoogleProvider(uid: uid, email: email, displayName: displayName)),
      appleProvider: _getLoginProvider(firebaseUser, const AppleProviderId(), (uid, email, displayName) => AppleProvider(uid: uid, email: email, displayName: displayName)),
      workspace: (userResponse.workspace != null) ? _workspaceResponseMapper(userResponse.workspace!) : null,
    );
  }

  T? _getLoginProvider<T extends LoginProvider>(FirebaseUser firebaseUser, ProviderId providerId, T Function(String uid, String? email, String displayName) transform) {
    final userInfos = firebaseUser.providerData.where((element) => element.providerId == providerId.value).toList();
    if (userInfos.isNotEmpty) {
      final userInfo = userInfos.first;
      return transform(userInfo.uid!, userInfo.email, userInfo.displayName ?? '');
    } else {
      return null;
    }
  }
}
