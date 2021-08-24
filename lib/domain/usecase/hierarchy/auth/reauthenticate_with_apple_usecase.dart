import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';

abstract class ReauthenticateWithAppleUseCase {
  Future<void> call(final AppleAuthInfo authInfo);
}
