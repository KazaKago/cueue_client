import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/sign_in_check_result.dart';

abstract class SignUpWithPasswordUseCase {
  Future<SignInCheckResult> call(PasswordAuthInfo authInfo);
}
