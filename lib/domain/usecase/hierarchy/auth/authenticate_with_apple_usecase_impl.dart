import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_apple_usecase.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_in_check_result.dart';

class AuthenticateWithAppleUseCaseImpl implements AuthenticateWithAppleUseCase {
  const AuthenticateWithAppleUseCaseImpl(this._authorizeApiRepository, this._userRepository);

  final AuthorizeRepository _authorizeApiRepository;
  final UserRepository _userRepository;

  @override
  Future<SignInCheckResult> call(AppleAuthInfo authInfo) async {
    await _authorizeApiRepository.authenticateWithApple(authInfo);
    await _userRepository.create();
    final user = await _userRepository.get();
    if (user.workspaces.isEmpty) {
      return SignInCheckResult.workspaceCreation;
    } else {
      return SignInCheckResult.afterSignIn;
    }
  }
}
