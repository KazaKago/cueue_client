import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/sign_in_check_result.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_up_with_password_usecase.dart';

class SignUpWithPasswordUseCaseImpl implements SignUpWithPasswordUseCase {
  const SignUpWithPasswordUseCaseImpl(this._authorizeApiRepository, this._userRepository);

  final AuthorizeRepository _authorizeApiRepository;
  final UserRepository _userRepository;

  @override
  Future<SignInCheckResult> call(PasswordAuthInfo authInfo) async {
    await _authorizeApiRepository.signUpWithPassword(authInfo);
    final user = await _userRepository.create();
    if (user.workspaces.isEmpty) {
      return SignInCheckResult.workspaceCreation;
    } else {
      return SignInCheckResult.afterSignIn;
    }
  }
}
