import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';

abstract class AuthenticateWithAppleUseCase {
  Future<void> call(AppleAuthInfo authInfo);
}
