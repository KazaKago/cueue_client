import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_in_check_result.dart';

abstract class AuthenticateWithGoogleUseCase {
  Future<SignInCheckResult> call(GoogleAuthInfo authInfo);
}
