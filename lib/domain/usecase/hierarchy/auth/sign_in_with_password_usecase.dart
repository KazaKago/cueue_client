import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_in_check_result.dart';

abstract class SignInWithPasswordUseCase {
  Future<SignInCheckResult> call(PasswordAuthInfo authInfo);
}
