import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';

abstract class ReauthenticateWithAppleUseCase {
  Future<void> call(AppleAuthInfo authInfo, RequireReauthenticationException exception);
}
