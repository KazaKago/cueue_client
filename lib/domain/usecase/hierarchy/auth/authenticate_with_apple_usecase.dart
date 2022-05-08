import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_in_check_result.dart';

abstract class AuthenticateWithAppleUseCase {
  Future<SignInCheckResult> call(AppleAuthInfo authInfo);
}
