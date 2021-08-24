import 'package:cueue/data/auth/hierarchy/apple/apple_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/google/google_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/password/password_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/provider_id.dart';
import 'package:cueue/domain/model/hierarchy/user/apple_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/google_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/login_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/password_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserResponseMapper {
  const UserResponseMapper();

  User map(final auth.User firebaseUser) {
    return User(
      id: UserId(firebaseUser.uid),
      email: Email(firebaseUser.email!),
      isEmailVerified: firebaseUser.emailVerified,
      passwordProvider: _getLoginProvider(firebaseUser, const PasswordProviderId(), (userId, displayName) => PasswordProvider(uid: userId, displayName: displayName)),
      googleProvider: _getLoginProvider(firebaseUser, const GoogleProviderId(), (userId, displayName) => GoogleProvider(uid: userId, displayName: displayName)),
      appleProvider: _getLoginProvider(firebaseUser, const AppleProviderId(), (userId, displayName) => AppleProvider(uid: userId, displayName: displayName)),
    );
  }

  T? _getLoginProvider<T extends LoginProvider>(final auth.User firebaseUser, final ProviderId providerId, final T Function(UserId userId, String displayName) transform) {
    final userInfos = firebaseUser.providerData.where((element) => element.providerId == providerId.value).toList();
    if (userInfos.isNotEmpty) {
      final userInfo = userInfos.first;
      return transform(UserId(userInfo.uid!), userInfo.displayName ?? userInfo.email ?? '');
    } else {
      return null;
    }
  }
}
